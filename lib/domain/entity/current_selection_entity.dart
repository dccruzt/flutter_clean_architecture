import 'package:equatable/equatable.dart';

import 'vehicle_entity.dart';

class CurrentSelectionEntity extends Equatable {
  const CurrentSelectionEntity({
    required this.application,
    this.vehicle,
    this.pickupDistance,
  });

  final String application;
  final VehicleEntity? vehicle;
  final int? pickupDistance;

  @override
  List<Object?> get props => [
        application,
        vehicle,
        pickupDistance,
      ];
}
