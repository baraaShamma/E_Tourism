

import 'package:e_tourism/features/trips/domain/repositories/trips_repository.dart';

class RegisterForTripUseCase {
  final TripsRepository repository;
  RegisterForTripUseCase(this.repository);
  Future<String> call(int tripId) {
    return repository.registerForTrip(tripId);
  }
}
