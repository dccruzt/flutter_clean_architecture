import 'package:flutter_clean_architecture/domain/entity/application_entity.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_applications_use_case.dart';
import 'package:flutter_clean_architecture/ui/controller/applications_controller.dart';
import 'package:flutter_clean_architecture/ui/page/applications_page.dart';
import 'package:flutter_clean_architecture/ui/widget/reservation_action_row.dart';
import 'package:flutter_clean_architecture/ui/widget/secondary_action_row.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mocktail/mocktail.dart';

import 'applications_page_test.mocks.dart';

class MockApplicationsCubit extends MockCubit<ApplicationsState>
    implements ApplicationsCubit {}

class ApplicationsStateFake extends Fake implements ApplicationsState {}

@GenerateMocks([GetApplicationsUseCase])
void main() {
  late MockApplicationsCubit applicationsCubit;
  late MockGetApplicationsUseCase getApplicationsUseCase;

  setUp(() {
    applicationsCubit = MockApplicationsCubit();
    getApplicationsUseCase = MockGetApplicationsUseCase();
  });

  setUpAll(() {
    registerFallbackValue(ApplicationsStateFake());
  });

  const applications = [
    ApplicationEntity(
      id: '1',
      name: 'Driver Test',
      pickupDistances: [1, 3, 5],
    ),
    ApplicationEntity(
      id: '2',
      name: 'Uber',
      pickupDistances: [7, 9, 11],
    ),
  ];

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    when(() => applicationsCubit.state).thenReturn(
      const ApplicationsState(applications: applications), // the desired state
    );

    await tester.pumpWidget(
      Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: const MediaQueryData(),
            child: ApplicationsCubitProvider(
              create: (context) => applicationsCubit,
              useCase: getApplicationsUseCase,
              child: const ApplicationsScreen(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Driver Test'), findsOneWidget);
    expect(find.text('Uber'), findsOneWidget);
    expect(find.byType(ReservationActionRow), findsOneWidget);
    expect(find.byType(MembershipActionRow), findsOneWidget);
    expect(find.byType(AddAppActionRow), findsOneWidget);
  });
}
