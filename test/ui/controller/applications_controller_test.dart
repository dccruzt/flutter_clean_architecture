import 'package:flutter_clean_architecture/domain/entity/application_entity.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_applications_use_case.dart';
import 'package:flutter_clean_architecture/ui/controller/applications_controller.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'applications_controller_test.mocks.dart';

@GenerateMocks([GetApplicationsUseCase])
void main() {
  late MockGetApplicationsUseCase getApplicationsUseCase;

  setUp(() {
    getApplicationsUseCase = MockGetApplicationsUseCase();
  });

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

  var error = Error();

  group('#validate', () {
    blocTest(
      'should return applications',
      build: () => ApplicationsCubit(useCase: getApplicationsUseCase),
      setUp: () => when(getApplicationsUseCase.call())
          .thenAnswer((_) async => applications),
      act: (cubit) => cubit.getApplications(),
      expect: () => [
        const ApplicationsState(applications: applications),
      ],
      verify: (cubit) => verify(getApplicationsUseCase.call()).called(1),
    );

    blocTest(
      'should return error',
      build: () => ApplicationsCubit(useCase: getApplicationsUseCase),
      setUp: () => when(getApplicationsUseCase.call())
          .thenAnswer((_) async => throw error),
      act: (cubit) => cubit.getApplications(),
      expect: () => [
        ApplicationsState(
          applications: null,
          error: error,
        ),
      ],
    );
  });
}
