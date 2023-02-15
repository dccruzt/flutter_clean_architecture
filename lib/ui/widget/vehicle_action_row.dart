import 'package:flutter/material.dart';

import '../../core/design_system/component/action_row.dart';

class VehicleActionRow extends StatelessWidget {
  const VehicleActionRow({
    Key? key,
    this.vehiclePlate,
    required this.onVehicleTap,
  }) : super(key: key);

  final String? vehiclePlate;
  final ValueChanged<String> onVehicleTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ActionRow(
      primary: Text(vehiclePlate ?? 'Select vehicle'),
      title: Text(
        'VEHICLE',
        style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => onVehicleTap(''),
    );
  }
}
