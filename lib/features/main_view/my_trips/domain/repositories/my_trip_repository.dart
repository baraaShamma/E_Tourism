
import 'package:e_tourism/features/main_view/my_trips/domain/entities/my_trip.dart';

abstract class MyTripRepository {
  Future<List<MyTrip>> getRegisteredTrips();
}
