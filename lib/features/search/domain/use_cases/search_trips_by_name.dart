
import 'package:e_tourism/features/search/domain/entities/search_trip_entity.dart';
import 'package:e_tourism/features/search/domain/repositories/search_trips_repository.dart';
class SearchTripsByName {
  final SearchTripsRepository repository;

  SearchTripsByName(this.repository);

  Future<List<SearchTripEntity>> call(String name) async {
    return await repository.searchTripsByName(name);
  }
}


