import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/design_system/component/action_row.dart';

class AddAppActionRow extends StatelessWidget {
  const AddAppActionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ActionRow(
      leading: SvgPicture.asset('assets/icons/plus_circle.svg'),
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
      leading:
          SvgPicture.asset('assets/icons/book_open.svg', color: Colors.blue),
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
      leading: SvgPicture.asset('assets/icons/info.svg', color: Colors.blue),
      primary:
          Text('MULTI membership and fees', style: theme.textTheme.bodyLarge),
      hasDivider: false,
      onTap: () {},
    );
  }
}
