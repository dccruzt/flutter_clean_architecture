import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/design_system/component/action_row.dart';
import '../../core/design_system/spacings.dart';
import '../../domain/entity/application_entity.dart';

class ApplicationsRowList extends StatelessWidget {
  const ApplicationsRowList({
    Key? key,
    required this.applications,
    required this.onAppTap,
  }) : super(key: key);

  final List<ApplicationEntity> applications;
  final ValueChanged<ApplicationEntity> onAppTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        ...applications
            .map((application) => ActionRow(
                  leading: Image.asset('assets/images/uber.png', width: x8),
                  trailing: SvgPicture.asset(
                    'assets/icons/settings.svg',
                    width: x6,
                    color: Colors.grey,
                  ),
                  primary: Text(application.name),
                  title: application.id == applications.first.id
                      ? Text(
                          'CONNECTED APPS',
                          style: theme.textTheme.titleSmall
                              ?.copyWith(color: Colors.grey),
                        )
                      : null,
                  onTap: () => onAppTap(application),
                ))
            .toList(growable: false)
      ],
    );
  }
}
