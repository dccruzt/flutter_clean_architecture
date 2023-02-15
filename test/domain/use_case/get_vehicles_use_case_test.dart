import 'package:flutter_clean_architecture/domain/entity/vehicle_entity.dart';
import 'package:flutter_clean_architecture/domain/repository/app_vehicles_repository.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_vehicles_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_applications_use_case_test.mocks.dart';

@GenerateMocks([AppVehiclesRepository])
void main() {
  final repository = MockAppVehiclesRepository();
  final useCase = GetVehiclesUseCase(repository: repository);

  const vehicles = [
    VehicleEntity(id: '1', plate: 'NH1111', model: 'Polo'),
    VehicleEntity(id: '2', plate: 'NH2222', model: 'Audi'),
  ];

  test('should call getVehicles method', () async {
    when(repository.getVehicles()).thenAnswer((_) async => []);

    await useCase.call();

    verify(repository.getVehicles()).called(1);
  });

  test('should return vehicles list', () async {
    when(repository.getVehicles()).thenAnswer((_) async => vehicles);

    final result = await useCase.call();

    expect(result, vehicles);
  });
}
