
import 'package:e_tourism/features/search/domain/entities/search_trip_by_date_entity.dart';
import 'package:e_tourism/features/search/domain/entities/search_trip_entity.dart';

abstract class SearchTripsRepository {
  Future<List<SearchTripEntity>> searchTripsByName(String name);
  Future<List<SearchTripByDateEntity>> searchTripsByDate(String startDate, String endDate);
  Future<String> registerForTrip(int tripId);
}
