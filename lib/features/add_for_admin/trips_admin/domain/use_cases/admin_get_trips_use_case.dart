

import 'package:e_tourism/features/add_for_admin/trips_admin/domain/entities/admin_trip.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/domain/repositories/admin_trip_repository.dart';

class AdminGetTripsUseCase {
  final AdminTripRepository repository;

  AdminGetTripsUseCase(this.repository);

  Future<List<Trip>> call() async {
    return await repository.getTrips();
  }
}
