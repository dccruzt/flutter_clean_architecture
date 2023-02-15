import 'package:equatable/equatable.dart';

class VehicleEntity extends Equatable {
  const VehicleEntity({
    required this.id,
    this.plate,
    this.model,
  });

  final String id;
  final String? plate;
  final String? model;

  @override
  List<Object?> get props => [
        id,
        plate,
        model,
      ];
}
