
import 'package:e_tourism/features/search/domain/entities/search_trip_by_date_entity.dart';
import 'package:e_tourism/features/search/domain/repositories/search_trips_repository.dart';

class SearchTripsByDates {
  final SearchTripsRepository repository;

  SearchTripsByDates(this.repository);

  Future<List<SearchTripByDateEntity>> call(String startDate, String endDate) async {
    return await repository.searchTripsByDate(startDate, endDate);
  }
}
