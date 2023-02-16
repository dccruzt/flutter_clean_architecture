import 'package:equatable/equatable.dart';

class ApplicationEntity extends Equatable {
  const ApplicationEntity({
    required this.id,
    required this.name,
    this.pickupDistances,
    this.picture,
  });

  final String id;
  final String name;
  final List<int>? pickupDistances;
  final String? picture;

  @override
  List<Object?> get props => [
        id,
        name,
        pickupDistances,
        picture,
      ];
}
