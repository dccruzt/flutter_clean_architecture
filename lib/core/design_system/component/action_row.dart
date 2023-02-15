import 'package:flutter/material.dart';

import '../spacings.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({
    Key? key,
    this.leading,
    this.trailing,
    this.primary,
    this.secondary,
    this.title,
    this.onTap,
    this.hasDivider = true,
  }) : super(key: key);

  final Widget? leading;
  final Widget? trailing;
  final Widget? primary;
  final Widget? secondary;
  final Widget? title;
  final bool hasDivider;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: x4, bottom: x2),
            child: title!,
          ),
          const Divider(height: 0),
        ],
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(x4),
            child: Row(
              children: [
                if (leading != null) ...[
                  leading!,
                  const SizedBox(width: x4),
                ],
                if (primary != null) primary!,
                const Spacer(),
                if (secondary != null) secondary!,
                const SizedBox(width: x4),
                if (trailing != null) trailing!,
              ],
            ),
          ),
        ),
        if (hasDivider) const Divider(height: 0),
      ],
    );
  }
}
