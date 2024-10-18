import 'package:e_tourism/features/add_for_admin/trips_admin/data/models/trip_admin_model.dart';

class Trip {
  final int id;
  final int touristProgramId;
  final int busId;
  final int guideId;
  final String price;
  final int maxCapacity;
  final String tripDate;
  final TouristProgram touristProgram;
  final List<TripImage> tripImages;

  Trip({
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
}
