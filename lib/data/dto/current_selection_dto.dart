import 'vehicle_dto.dart';

class CurrentSelectionDTO {
  CurrentSelectionDTO({
    required this.application,
    this.lastSelectedVehicle,
    this.maxPickupRadius,
  });

  final String application;
  final VehicleDTO? lastSelectedVehicle;
  final int? maxPickupRadius;

  factory CurrentSelectionDTO.fromJson(
          String application, Map<String, dynamic> json) =>
      CurrentSelectionDTO(
        application: application,
        lastSelectedVehicle: json['lastSelectedVehicle'] != null
            ? VehicleDTO.fromJson(json['lastSelectedVehicle'])
            : null,
        maxPickupRadius: json['maxPickupRadius'],
      );

  Map<String, dynamic> toJson() => {
        'lastSelectedVehicle': lastSelectedVehicle?.toJson(),
        'maxPickupRadius': maxPickupRadius,
      };
}
