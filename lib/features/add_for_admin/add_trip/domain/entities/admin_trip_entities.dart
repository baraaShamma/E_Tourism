// admin_trip_entities.dart

import 'package:equatable/equatable.dart';

class AdminTripEntity extends Equatable {
  final int programId;
  final int busId;
  final int guideId;
  final int price;
  final int maxCapacity;
  final String tripDate;

  AdminTripEntity({
    required this.programId,
    required this.busId,
    required this.guideId,
    required this.price,
    required this.maxCapacity,
    required this.tripDate,
  });

  @override
  List<Object?> get props => [programId, busId, guideId, price, maxCapacity, tripDate];
}
