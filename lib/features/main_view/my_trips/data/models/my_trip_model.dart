import 'package:e_tourism/features/main_view/my_trips/domain/entities/my_trip.dart';

class MyTripModel extends MyTrip {
  MyTripModel({
    required int id,
    required String name,
    required String description,
    required String busType,
    required Guide guide,
    required String tripDate,
    required List<String> images,
  }) : super(
          id: id,
          name: name,
          description: description,
          busType: busType,
          guide: guide,
          tripDate: tripDate,
          images: images,
        );

  factory MyTripModel.fromJson(Map<String, dynamic> json) {
    return MyTripModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      busType: json['bus_type'],
      guide: Guide.fromJson(json['guide']),
      tripDate: json['trip_date'],
      images: List<String>.from(json['images']),
    );
  }
}
