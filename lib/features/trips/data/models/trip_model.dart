import 'package:e_tourism/features/trips/domain/entities/trip.dart';

class TripModel extends Trip {
  TripModel({
    required int id,
    required int touristProgramId,
    required String busType,
    required Guide guide,
    required String price,
    required int maxCapacity,
    required String tripDate,
    required List<String> images,
  }) : super(
    id: id,
    touristProgramId: touristProgramId,
    busType: busType,
    guide: guide,
    price: price,
    maxCapacity: maxCapacity,
    tripDate: tripDate,
    images: images,
  );

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      touristProgramId: json['tourist_program_id'],
      busType: json['bus_type'],
      guide: Guide.fromJson(json['guide']),
      price: json['price'],
      maxCapacity: json['max_capacity'],
      tripDate: json['trip_date'],
      images: List<String>.from(json['images']),
    );
  }
}
