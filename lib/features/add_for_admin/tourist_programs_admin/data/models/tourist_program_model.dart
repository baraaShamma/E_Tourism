class TouristProgramAdminModel {
  final int id;
  final String type;
  final String name;
  final String description;
  final String image;

  TouristProgramAdminModel({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.image,
  });

  factory TouristProgramAdminModel.fromJson(Map<String, dynamic> json) {
    return TouristProgramAdminModel(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }
}
