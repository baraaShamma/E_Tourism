
import 'package:e_tourism/features/search/domain/repositories/search_trips_repository.dart';

class RegisterForTripSearchUseCase {
  final SearchTripsRepository repository;

  RegisterForTripSearchUseCase(this.repository);

  Future<String> call(int tripId) {
    return repository.registerForTrip(tripId);
  }
}
