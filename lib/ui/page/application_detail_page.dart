import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_routes.dart';
import '../../core/design_system/spacings.dart';
import '../controller/application_detail_controller.dart';
import '../widget/vehicle_action_row.dart';
import '../widget/vehicle_radius_action_row.dart';
import 'arguments/application_detail_arguments.dart';

class ApplicationDetailPage extends StatelessWidget {
  const ApplicationDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ApplicationDetailArguments;

    return ApplicationDetailCubitProvider(
      application: args.application.name,
      child: BlocBuilder<ApplicationDetailCubit, ApplicationDetailState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text('Configure ${args.application.name}'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: Navigator.of(context).pop,
            ),
          ),
          body: Column(
            children: [
              const SizedBox(height: x4),
              VehicleActionRow(
                vehiclePlate: state.currentSelection?.vehicle?.plate,
                onVehicleTap: (vehicleId) => Navigator.pushNamed(
                  context,
                  AppRoutes.vehicleSelection,
                  arguments:
                      ApplicationDetailArguments(application: args.application),
                ),
              ),
              const SizedBox(height: x10),
              VehicleRadiusActionRow(
                currentDistance: state.currentSelection?.pickupDistance,
                pickupDistances: args.application.pickupDistances ?? [],
                onTap: (int value) => ApplicationDetailCubitProvider.of(context)
                    .savePickupDistance(value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
