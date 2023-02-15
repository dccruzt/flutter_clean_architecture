import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/design_system/component/search_bar.dart';
import '../../core/design_system/spacings.dart';
import '../../domain/entity/vehicle_entity.dart';
import '../controller/vehicles_controller.dart';
import '../widget/vehicle_selection_button.dart';
import '../widget/vehicles_radio_list.dart';
import 'arguments/application_detail_arguments.dart';

class VehiclesPage extends StatelessWidget {
  const VehiclesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ApplicationDetailArguments;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select vehicle'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: Navigator.of(context).pop,
          ),
        ),
        body: VehiclesCubitProvider(
          application: args.application.name,
          child: BlocBuilder<VehiclesCubit, VehiclesState>(
            builder: (context, state) {
              final vehicleName = state.selectedVehicle?.plate ?? 'vehicle';

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ListView(
                      children: [
                        const SizedBox(height: x4),
                        const Padding(
                          padding: EdgeInsets.only(left: x4),
                          child:
                              Text('Select the vehicle you are going to drive'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(x4),
                          child: SearchBar(
                            hint: 'Search...',
                            onChanged: (query) =>
                                VehiclesCubitProvider.of(context)
                                    .filterVehicles(query),
                            onClear:
                                VehiclesCubitProvider.of(context).clearSearch,
                          ),
                        ),
                        VehiclesRadioList(
                          currentVehicle: state.selectedVehicle,
                          onChanged: (VehicleEntity? value) {
                            if (value != null) {
                              VehiclesCubitProvider.of(context)
                                  .updateVehicleSelection(value);
                            }
                          },
                          vehicles: state.filteredVehicles ?? [],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(x4),
                    child: VehicleSelectionButton(
                      onPressed: state.selectedVehicle ==
                              state.currentSelection?.vehicle
                          ? null
                          : () {
                              VehiclesCubitProvider.of(context)
                                  .setSelectedVehicle()
                                  .then((_) => Navigator.pop(context));
                            },
                      vehicleName: vehicleName,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
