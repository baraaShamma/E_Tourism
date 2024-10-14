import 'package:equatable/equatable.dart';

class TouristProgramsEntity extends Equatable {
  final int? id;
  final String type;
  final String name;
  final String description;
  final String image;
  final int? hasTrips;

  const TouristProgramsEntity({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.image,
    required this.hasTrips,
  });

  @override
  List<Object?> get props => [id, type, name, description, image, hasTrips];
}
