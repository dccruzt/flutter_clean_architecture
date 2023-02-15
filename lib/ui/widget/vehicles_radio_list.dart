import 'package:flutter/material.dart';

import '../../domain/entity/vehicle_entity.dart';

class VehiclesRadioList extends StatelessWidget {
  const VehiclesRadioList({
    Key? key,
    required this.vehicles,
    this.currentVehicle,
    required this.onChanged,
  }) : super(key: key);

  final List<VehicleEntity> vehicles;
  final VehicleEntity? currentVehicle;
  final ValueChanged<VehicleEntity?> onChanged;

  String getVehicleDescription(String? licensePlate, String? vehicleModel) =>
      '$licensePlate ($vehicleModel)';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        ...vehicles
            .map(
              (vehicle) => Column(
                children: [
                  RadioListTile<VehicleEntity>(
                    value: vehicle,
                    groupValue: currentVehicle,
                    title: Text(
                        getVehicleDescription(
                          vehicle.plate,
                          vehicle.model,
                        ),
                        style: theme.textTheme.bodyMedium),
                    onChanged: (_) => onChanged.call(vehicle),
                    activeColor: Colors.blue,
                    controlAffinity: ListTileControlAffinity.trailing,
                    selected: vehicle == currentVehicle,
                  ),
                  const Divider(height: 0),
                ],
              ),
            )
            .toList(),
      ],
    );
  }
}
