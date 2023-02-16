import 'package:flutter/material.dart';

import '../../core/design_system/colors.dart';
import '../../core/design_system/spacings.dart';

class VehicleSelectionButton extends StatelessWidget {
  const VehicleSelectionButton({
    Key? key,
    this.vehicleName,
    this.onPressed,
  }) : super(key: key);

  final String? vehicleName;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(x12),
        backgroundColor: primaryPurple,
        disabledBackgroundColor: disabledBlue,
        disabledForegroundColor: disabledColor,
        textStyle: theme.textTheme.bodyLarge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(x2)),
      ),
      child: Text('Select $vehicleName'),
    );
  }
}
