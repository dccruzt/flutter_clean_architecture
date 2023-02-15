import 'package:flutter_clean_architecture/domain/entity/vehicle_entity.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_vehicles_use_case.dart';
import 'package:flutter_clean_architecture/domain/use_case/manage_current_selection_use_case.dart';
import 'package:flutter_clean_architecture/ui/controller/vehicles_controller.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'vehicles_controller_test.mocks.dart';

@GenerateMocks([
  GetVehiclesUseCase,
  ManageCurrentSelectionUseCase,
])
void main() {
  late MockGetVehiclesUseCase getVehiclesUseCase;
  late MockManageCurrentSelectionUseCase manageCurrentSelectionUseCase;

  setUp(() {
    getVehiclesUseCase = MockGetVehiclesUseCase();
    manageCurrentSelectionUseCase = MockManageCurrentSelectionUseCase();
  });

  const vehicles = [
    VehicleEntity(id: '1', plate: 'NH1111', model: 'Polo'),
    VehicleEntity(id: '2', plate: 'NH2222', model: 'Audi'),
  ];

  const filteredVehicles = [
    VehicleEntity(id: '2', plate: 'NH2222', model: 'Audi'),
  ];

  var error = Error();

  group('#validate', () {
    blocTest(
      'should return vehicles',
      build: () => VehiclesCubit(
        application: 'uber',
        getVehiclesUseCase: getVehiclesUseCase,
        manageCurrentSelectionUseCase: manageCurrentSelectionUseCase,
      ),
      setUp: () =>
          when(getVehiclesUseCase.call()).thenAnswer((_) async => vehicles),
      act: (cubit) => cubit.getVehicles(),
      expect: () => [
        const VehiclesState(vehicles: vehicles, filteredVehicles: vehicles),
      ],
      verify: (cubit) => verify(getVehiclesUseCase.call()).called(1),
    );

    blocTest(
      'should return filtered vehicles',
      build: () => VehiclesCubit(
        application: 'uber',
        getVehiclesUseCase: getVehiclesUseCase,
        manageCurrentSelectionUseCase: manageCurrentSelectionUseCase,
      ),
      seed: () => const VehiclesState(vehicles: vehicles),
      act: (cubit) => cubit.filterVehicles('Audi'),
      expect: () => [
        const VehiclesState(
          vehicles: vehicles,
          filteredVehicles: filteredVehicles,
        ),
      ],
    );

    blocTest(
      'should return error',
      build: () => VehiclesCubit(
        application: 'uber',
        getVehiclesUseCase: getVehiclesUseCase,
        manageCurrentSelectionUseCase: manageCurrentSelectionUseCase,
      ),
      setUp: () =>
          when(getVehiclesUseCase.call()).thenAnswer((_) async => throw error),
      act: (cubit) => cubit.getVehicles(),
      expect: () => [
        VehiclesState(vehicles: null, filteredVehicles: null, error: error),
      ],
    );
  });
}
