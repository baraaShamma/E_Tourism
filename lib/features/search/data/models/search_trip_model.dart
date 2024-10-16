import 'package:e_tourism/features/search/domain/entities/search_trip_entity.dart';

class SearchTripModel extends SearchTripEntity {
  SearchTripModel({
    required int id,
    required int touristProgramId,
    required int busId,
    required int guideId,
    required String price,
    required int maxCapacity,
    required String tripDate,
    required String createdAt,
    required String updatedAt,
    required TouristProgramEntity touristProgram,
  }) : super(
          id: id,
          touristProgramId: touristProgramId,
          busId: busId,
          guideId: guideId,
          price: price,
          tripDate: tripDate,
          maxCapacity: maxCapacity,
          createdAt: createdAt,
          updatedAt: updatedAt,
          touristProgram: touristProgram,
        );

  factory SearchTripModel.fromJson(Map<String, dynamic> json) {
    return SearchTripModel(
      id: json['id'],
      touristProgramId: json['tourist_program_id'],
      busId: json['bus_id'],
      guideId: json['guide_id'],
      price: json['price'],
      maxCapacity: json['max_capacity'],
      tripDate: json['trip_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      touristProgram: TouristProgramEntity.fromJson(json['tourist_program']),
    );
  }
}
