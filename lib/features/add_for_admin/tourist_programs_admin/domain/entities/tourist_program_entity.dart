class TouristProgramAdminEntity {
  final int id;
  final String type;
  final String name;
  final String description;
  final String image;

  TouristProgramAdminEntity({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.image,
  });

  factory TouristProgramAdminEntity.fromModel(Map<String, dynamic> model) {
    return TouristProgramAdminEntity(
      id: model['id'],
      type: model['type'],
      name: model['name'],
      description: model['description'],
      image: model['image'],
    );
  }
}
