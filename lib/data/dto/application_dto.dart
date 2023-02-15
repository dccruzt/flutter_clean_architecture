class ApplicationDTO {
  ApplicationDTO({
    required this.id,
    required this.name,
    this.maxPickupDistanceSteps,
  });

  final String id;
  final String name;
  final List<int>? maxPickupDistanceSteps;

  factory ApplicationDTO.fromJson(Map<String, dynamic> json) => ApplicationDTO(
        id: json['id'],
        name: json['name'],
        maxPickupDistanceSteps: (json['maxPickupDistanceSteps'] as Iterable)
            .map((e) => e as int)
            .toList(growable: false),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'maxPickupDistanceSteps': maxPickupDistanceSteps,
      };
}
