class VehicleDTO {
  VehicleDTO({
    this.vehicleId,
    this.licensePlate,
    this.vehicleModel,
  });

  final String? vehicleId;
  final String? licensePlate;
  final String? vehicleModel;

  factory VehicleDTO.fromJson(Map<String, dynamic> json) => VehicleDTO(
        vehicleId: json['vehicleId'],
        licensePlate: json['licensePlate'],
        vehicleModel: json['vehicleModel'],
      );

  Map<String, dynamic> toJson() => {
        'vehicleId': vehicleId,
        'licensePlate': licensePlate,
        'vehicleModel': vehicleModel,
      };
}
