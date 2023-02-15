import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/dependency_injection.dart';
import '../../domain/entity/current_selection_entity.dart';
import '../../domain/entity/vehicle_entity.dart';
import '../../domain/use_case/get_vehicles_use_case.dart';
import '../../domain/use_case/manage_current_selection_use_case.dart';

class VehiclesCubitProvider extends BlocProvider<VehiclesCubit> {
  VehiclesCubitProvider({
    super.key,
    super.child,
    GetVehiclesUseCase? useCase,
    required String application,
  }) : super(
            create: (context) => VehiclesCubit(
                  application: application,
                  getVehiclesUseCase: di(),
                  manageCurrentSelectionUseCase: di(),
                )
                  ..init()
                  ..getVehicles());

  static VehiclesCubit of(BuildContext context) =>
      BlocProvider.of<VehiclesCubit>(context);
}

class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit({
    required this.application,
    required this.getVehiclesUseCase,
    required this.manageCurrentSelectionUseCase,
  }) : super(const VehiclesState());

  final String application;
  final GetVehiclesUseCase getVehiclesUseCase;
  final ManageCurrentSelectionUseCase manageCurrentSelectionUseCase;

  StreamSubscription<CurrentSelectionEntity?>? _subscription;

  void init() {
    _subscription = manageCurrentSelectionUseCase.stream.listen(
      (event) => emit(
        state.copyWith(
          currentSelection: event,
          selectedVehicle: event?.vehicle,
        ),
      ),
      onError: (error) => state.copyWith(error: error),
    );
  }

  Future<void> getVehicles() {
    return getVehiclesUseCase
        .call()
        .then(
          (value) => emit(
            state.copyWith(vehicles: value, filteredVehicles: value),
          ),
        )
        .catchError(
          (error) => emit(state.copyWith(error: error)),
        );
  }

  void filterVehicles(String query) {
    try {
      final filteredVehicles = state.vehicles?.where((vehicle) {
        final description = '${vehicle.plate} (${vehicle.model})'.toLowerCase();
        return description.contains(query.toLowerCase());
      }).toList();
      emit(state.copyWith(filteredVehicles: filteredVehicles));
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void updateVehicleSelection(VehicleEntity selectedVehicle) =>
      emit(state.copyWith(selectedVehicle: selectedVehicle));

  Future<void> setSelectedVehicle() async {
    try {
      final currentSelection = CurrentSelectionEntity(
        application: application,
        pickupDistance: state.currentSelection?.pickupDistance,
        vehicle: state.selectedVehicle,
      );
      await manageCurrentSelectionUseCase.set(currentSelection);
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void clearSearch() => emit(state.copyWith(filteredVehicles: state.vehicles));

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

class VehiclesState extends Equatable {
  const VehiclesState({
    this.vehicles,
    this.filteredVehicles,
    this.currentSelection,
    this.selectedVehicle,
    this.error,
  });
  final List<VehicleEntity>? vehicles;
  final List<VehicleEntity>? filteredVehicles;
  final CurrentSelectionEntity? currentSelection;
  final VehicleEntity? selectedVehicle;
  final Object? error;

  VehiclesState copyWith({
    List<VehicleEntity>? vehicles,
    List<VehicleEntity>? filteredVehicles,
    CurrentSelectionEntity? currentSelection,
    VehicleEntity? selectedVehicle,
    Object? error,
  }) =>
      VehiclesState(
        vehicles: vehicles ?? this.vehicles,
        filteredVehicles: filteredVehicles ?? this.filteredVehicles,
        currentSelection: currentSelection ?? this.currentSelection,
        selectedVehicle: selectedVehicle ?? this.selectedVehicle,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [
        vehicles,
        filteredVehicles,
        currentSelection,
        selectedVehicle,
        error,
      ];
}
