class ApplicationDTO {
  ApplicationDTO({
    required this.id,
    required this.name,
    this.maxPickupDistanceSteps,
    this.picture,
  });

  final String id;
  final String name;
  final List<int>? maxPickupDistanceSteps;
  final String? picture;

  factory ApplicationDTO.fromJson(Map<String, dynamic> json) => ApplicationDTO(
        id: json['id'],
        name: json['name'],
        maxPickupDistanceSteps: (json['maxPickupDistanceSteps'] as Iterable)
            .map((e) => e as int)
            .toList(growable: false),
        picture: json['picture'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'maxPickupDistanceSteps': maxPickupDistanceSteps,
        'picture': picture,
      };
}
