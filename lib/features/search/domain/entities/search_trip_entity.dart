class SearchTripEntity {
  final int id;
  final int touristProgramId;
  final int busId;
  final int guideId;
  final String price;
  final int maxCapacity;
  final String tripDate;
  final String createdAt;
  final String updatedAt;
  final TouristProgramEntity touristProgram;

  SearchTripEntity({
    required this.id,
    required this.touristProgramId,
    required this.busId,
    required this.guideId,
    required this.price,
    required this.maxCapacity,
    required this.tripDate,
    required this.createdAt,
    required this.updatedAt,
    required this.touristProgram,
  });
}

class TouristProgramEntity {
  final int id;
  final String type;
  final String name;
  final String description;
  final String? image;
  final String createdAt;
  final String updatedAt;

  TouristProgramEntity({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });
  factory TouristProgramEntity.fromJson(Map<String, dynamic> json) {
    return TouristProgramEntity(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
