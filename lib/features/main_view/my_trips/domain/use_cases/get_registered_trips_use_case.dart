

import 'package:e_tourism/features/main_view/my_trips/domain/entities/my_trip.dart';
import 'package:e_tourism/features/main_view/my_trips/domain/repositories/my_trip_repository.dart';

class GetRegisteredTripsUseCase {
  final MyTripRepository repository;

  GetRegisteredTripsUseCase({required this.repository});

  Future<List<MyTrip>> call() async {
    return await repository.getRegisteredTrips();
  }
}
