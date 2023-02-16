import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/design_system/colors.dart';

import '../../core/design_system/component/action_row.dart';

class RadiusSelector extends StatefulWidget {
  const RadiusSelector({
    Key? key,
    this.currentDistance,
    required this.pickupDistances,
    required this.onTap,
  }) : super(key: key);

  final int? currentDistance;
  final List<int> pickupDistances;
  final ValueChanged<int> onTap;

  @override
  State<RadiusSelector> createState() => _RadiusSelectorState();
}

class _RadiusSelectorState extends State<RadiusSelector> {
  late int index;

  int get distancesLength => widget.pickupDistances.length;

  bool get isMinLimit => index == 0;

  bool get isMaxLimit => index == distancesLength - 1;

  int get currentDistanceIndex {
    if (widget.currentDistance != null) {
      final index = widget.pickupDistances.indexOf(widget.currentDistance!);
      return index != -1 ? index : 0;
    }
    return 0;
  }

  void decreaseDistance() {
    if (index > 0) {
      index--;
      widget.onTap(widget.pickupDistances[index]);
    }
  }

  void increaseDistance() {
    if (index < distancesLength - 1) {
      index++;
      widget.onTap(widget.pickupDistances[index]);
    }
  }

  @override
  void initState() {
    index = currentDistanceIndex;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RadiusSelector oldWidget) {
    index = currentDistanceIndex;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          color: isMinLimit ? Colors.grey : primaryPurple,
          onPressed: isMinLimit ? null : () => setState(decreaseDistance),
        ),
        Text('${widget.pickupDistances[index]} km'),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          color: isMaxLimit ? Colors.grey : primaryPurple,
          onPressed: isMaxLimit ? null : () => setState(increaseDistance),
        ),
      ],
    );
  }
}

class VehicleRadiusActionRow extends StatelessWidget {
  const VehicleRadiusActionRow({
    Key? key,
    this.currentDistance,
    required this.pickupDistances,
    required this.onTap,
  }) : super(key: key);

  final int? currentDistance;
  final List<int> pickupDistances;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ActionRow(
      primary: const Text('Receive offers within'),
      title: Text(
        'DRIVER TEST PICKUP RADIUS',
        style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey),
      ),
      trailing: RadiusSelector(
        currentDistance: currentDistance,
        pickupDistances: pickupDistances,
        onTap: onTap,
      ),
    );
  }
}
