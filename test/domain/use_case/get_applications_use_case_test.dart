import 'package:flutter_clean_architecture/domain/entity/application_entity.dart';
import 'package:flutter_clean_architecture/domain/repository/app_vehicles_repository.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_applications_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_applications_use_case_test.mocks.dart';

@GenerateMocks([AppVehiclesRepository])
void main() {
  final repository = MockAppVehiclesRepository();
  final useCase = GetApplicationsUseCase(repository: repository);

  const applications = [
    ApplicationEntity(
      id: '1',
      name: 'application_1',
      pickupDistances: [1, 3, 5],
    ),
    ApplicationEntity(
      id: '2',
      name: 'application_2',
      pickupDistances: [7, 9, 11],
    ),
  ];

  test('should call getApplications method', () async {
    when(repository.getApplications()).thenAnswer((_) async => []);

    await useCase.call();

    verify(repository.getApplications()).called(1);
  });

  test('should return applications list', () async {
    when(repository.getApplications()).thenAnswer((_) async => applications);

    final result = await useCase.call();

    expect(result, applications);
  });
}
