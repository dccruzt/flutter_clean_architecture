import 'package:equatable/equatable.dart';

class ApplicationEntity extends Equatable {
  const ApplicationEntity({
    required this.id,
    required this.name,
    this.pickupDistances,
  });

  final String id;
  final String name;
  final List<int>? pickupDistances;

  @override
  List<Object?> get props => [
        id,
        name,
        pickupDistances,
      ];
}
