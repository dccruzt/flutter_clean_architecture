import 'package:flutter_clean_architecture/domain/entity/current_selection_entity.dart';
import 'package:flutter_clean_architecture/domain/entity/vehicle_entity.dart';
import 'package:flutter_clean_architecture/domain/repository/app_vehicles_repository.dart';
import 'package:flutter_clean_architecture/domain/use_case/manage_current_selection_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_applications_use_case_test.mocks.dart';

@GenerateMocks([AppVehiclesRepository])
void main() {
  final repository = MockAppVehiclesRepository();
  final useCase = ManageCurrentSelectionUseCase(repository: repository);

  const String application = 'application';
  const currentSelection = CurrentSelectionEntity(
    application: application,
    vehicle: VehicleEntity(id: '1', plate: 'NH1111', model: 'Polo'),
    pickupDistance: 5,
  );

  test('should call readCurrentSelection method', () async {
    when(repository.readCurrentSelection(application))
        .thenAnswer((_) async => null);

    await useCase.read(application);

    verify(repository.readCurrentSelection(application)).called(1);
  });

  test('should call saveCurrentSelection method', () async {
    when(repository.saveCurrentSelection(currentSelection))
        .thenAnswer((_) async => Future.value);

    await useCase.set(currentSelection);

    verify(repository.saveCurrentSelection(currentSelection)).called(1);
  });
}
