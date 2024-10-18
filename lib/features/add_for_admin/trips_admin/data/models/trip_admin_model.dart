import 'package:e_tourism/features/add_for_admin/trips_admin/domain/entities/admin_trip.dart';

class TripModel {
  final int id;
  final int touristProgramId;
  final int busId;
  final int guideId;
  final String price;
  final int maxCapacity;
  final String tripDate;
  final TouristProgram touristProgram;
  final List<TripImage> tripImages;

  TripModel({
    required this.id,
    required this.touristProgramId,
    required this.busId,
    required this.guideId,
    required this.price,
    required this.maxCapacity,
    required this.tripDate,
    required this.touristProgram,
    required this.tripImages,
  });
// Define the toEntity method
  Trip toEntity() {
    return Trip(
      id: id,
      touristProgramId: touristProgramId,
      busId: busId,
      guideId: guideId,
      price: price,
      maxCapacity: maxCapacity,
      tripDate: tripDate,
      touristProgram: touristProgram,
      tripImages: tripImages,
    );
  }
  // Define fromJson method
  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      touristProgramId: json['tourist_program_id'],
      busId: json['bus_id'],
      guideId: json['guide_id'],
      price: json['price'],
      maxCapacity: json['max_capacity'],
      tripDate: json['trip_date'],
      touristProgram: TouristProgram.fromJson(json['tourist_program']),
      tripImages: (json['trip_images'] as List)
          .map((image) => TripImage.fromJson(image))
          .toList(),
    );
  }

  // Optionally, you can also define a toJson method if needed
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tourist_program_id': touristProgramId,
      'bus_id': busId,
      'guide_id': guideId,
      'price': price,
      'max_capacity': maxCapacity,
      'trip_date': tripDate,
      'tourist_program': touristProgram.toJson(),
      'trip_images': tripImages.map((image) => image.toJson()).toList(),
    };
  }
}
class TouristProgram {
  final int id;
  final String type;
  final String name;
  final String description;
  final String image;

  TouristProgram({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.image,
  });

  // Define fromJson method
  factory TouristProgram.fromJson(Map<String, dynamic> json) {
    return TouristProgram(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }

  // Define toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
class TripImage {
  final int id;
  final int touristTripId;
  final String image;

  TripImage({
    required this.id,
    required this.touristTripId,
    required this.image,
  });

  // Define fromJson method
  factory TripImage.fromJson(Map<String, dynamic> json) {
    return TripImage(
      id: json['id'],
      touristTripId: json['tourist_trip_id'],
      image: json['image'],
    );
  }

  // Define toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tourist_trip_id': touristTripId,
      'image': image,
    };
  }
}
