import 'package:flutter/material.dart';

import '../../core/design_system/component/action_row.dart';

class AddAppActionRow extends StatelessWidget {
  const AddAppActionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ActionRow(
      leading: const Icon(Icons.add_circle_outline),
      primary: Text('Add apps', style: theme.textTheme.bodyLarge),
      hasDivider: false,
      onTap: () {},
    );
  }
}

class MoreReservationsActionRow extends StatelessWidget {
  const MoreReservationsActionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ActionRow(
      leading: const Icon(Icons.menu_book),
      primary: Text('More reservations', style: theme.textTheme.bodyLarge),
      hasDivider: false,
      onTap: () {},
    );
  }
}

class MembershipActionRow extends StatelessWidget {
  const MembershipActionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ActionRow(
      leading: const Icon(Icons.info_outline),
      primary:
          Text('MULTI membership and fees', style: theme.textTheme.bodyLarge),
      hasDivider: false,
      onTap: () {},
    );
  }
}
