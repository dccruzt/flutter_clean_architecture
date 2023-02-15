import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_routes.dart';
import '../../core/design_system/spacings.dart';
import '../controller/applications_controller.dart';
import '../widget/applications_row_list.dart';
import '../widget/reservation_action_row.dart';
import '../widget/secondary_action_row.dart';
import 'arguments/application_detail_arguments.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationsCubit, ApplicationsState>(
      builder: (context, state) => Column(
        children: [
          ApplicationsRowList(
            onAppTap: (application) => Navigator.pushNamed(
              context,
              AppRoutes.applicationDetail,
              arguments: ApplicationDetailArguments(application: application),
            ),
            applications: state.applications ?? [],
          ),
          const AddAppActionRow(),
          const SizedBox(height: x10),
          const ReservationActionRow(),
          const MoreReservationsActionRow(),
          const MembershipActionRow(),
        ],
      ),
    );
  }
}

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ApplicationsCubitProvider(
        child: const ApplicationsScreen(),
      ),
    );
  }
}
