import 'package:flutter/material.dart';

import '../../core/design_system/component/action_row.dart';

class ReservationActionRow extends StatelessWidget {
  const ReservationActionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ActionRow(
      primary: const Text('You have no reservations accepted'),
      title: Text(
        'RESERVATIONS',
        style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey),
      ),
      onTap: () {},
    );
  }
}
