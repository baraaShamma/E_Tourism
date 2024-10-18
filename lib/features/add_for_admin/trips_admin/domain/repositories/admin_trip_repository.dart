import 'dart:io';

import 'package:e_tourism/features/add_for_admin/trips_admin/domain/entities/admin_trip.dart';

abstract class AdminTripRepository {
  Future<List<Trip>> getTrips();
  Future<void> deleteTrip(int id);
  Future<void> uploadTripImage(String tripId, File image); // New method for image upload
}
