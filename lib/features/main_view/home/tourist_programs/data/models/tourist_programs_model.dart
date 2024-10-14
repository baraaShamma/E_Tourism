import 'package:e_tourism/features/main_view/home/tourist_programs/domain/entities/tourist_programs_entity.dart';

class TouristProgramsModel extends TouristProgramsEntity {
  const TouristProgramsModel(
      {int? id,
      required String type,
      required String name,
      required String description,
      required String image,
      int? hasTrips})
      : super(
          id: id,
          type: type,
          name: name,
          description: description,
          image: image,
          hasTrips: hasTrips,
        );

  factory TouristProgramsModel.fromJson(Map<String, dynamic> json) {
    return TouristProgramsModel(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      hasTrips: json['has_trips'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'description': description,
      'image': image,
      'hasTrips': hasTrips
    };
  }
}
