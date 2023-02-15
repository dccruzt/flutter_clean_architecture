import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/dependency_injection.dart';
import '../../domain/entity/current_selection_entity.dart';
import '../../domain/use_case/manage_current_selection_use_case.dart';

class ApplicationDetailCubitProvider
    extends BlocProvider<ApplicationDetailCubit> {
  ApplicationDetailCubitProvider({
    super.key,
    super.child,
    required String application,
    ManageCurrentSelectionUseCase? useCase,
  }) : super(
            create: (context) => ApplicationDetailCubit(
                  useCase: di(),
                  application: application,
                )..init());

  static ApplicationDetailCubit of(BuildContext context) =>
      BlocProvider.of<ApplicationDetailCubit>(context);
}

class ApplicationDetailCubit extends Cubit<ApplicationDetailState> {
  ApplicationDetailCubit({
    required this.application,
    required this.useCase,
  }) : super(const ApplicationDetailState());

  final String application;
  final ManageCurrentSelectionUseCase useCase;

  StreamSubscription<CurrentSelectionEntity?>? _subscription;

  void init() {
    useCase.read(application);
    _subscription = useCase.stream.listen(
      (event) => emit(ApplicationDetailState(currentSelection: event)),
      onError: (error) => emit(state.copyWith(error: error)),
    );
  }

  void savePickupDistance(int pickupDistance) {
    try {
      final currentSelection = CurrentSelectionEntity(
        application: application,
        vehicle: state.currentSelection?.vehicle,
        pickupDistance: pickupDistance,
      );
      useCase.set(currentSelection);
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

class ApplicationDetailState extends Equatable {
  const ApplicationDetailState({
    this.currentSelection,
    this.error,
  });
  final CurrentSelectionEntity? currentSelection;
  final Object? error;

  ApplicationDetailState copyWith({
    CurrentSelectionEntity? currentSelection,
    Object? error,
  }) =>
      ApplicationDetailState(
        currentSelection: currentSelection ?? this.currentSelection,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [currentSelection, error];
}
