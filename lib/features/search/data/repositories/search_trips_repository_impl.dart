import 'package:e_tourism/features/search/data/data_sources/search_trips_remote_data_source.dart';
import 'package:e_tourism/features/search/data/models/search_trip_by_date_model.dart';
import 'package:e_tourism/features/search/data/models/search_trip_model.dart';
import 'package:e_tourism/features/search/domain/entities/search_trip_by_date_entity.dart';
import 'package:e_tourism/features/search/domain/entities/search_trip_entity.dart';
import 'package:e_tourism/features/search/domain/repositories/search_trips_repository.dart';

class SearchTripsRepositoryImpl implements SearchTripsRepository {
  final SearchTripsRemoteDataSource remoteDataSource;

  SearchTripsRepositoryImpl(this.remoteDataSource);

  @override

  Future<List<SearchTripEntity>> searchTripsByName(String name) async {
    final trips = await remoteDataSource.searchTripsByName(name);
    return trips.map((trip) => SearchTripModel.fromJson(trip)).toList();

  }

  @override

  Future<List<SearchTripByDateEntity>> searchTripsByDate(String startDate, String endDate) async {
    final trips = await remoteDataSource.searchTripsByDate(startDate, endDate);
    return trips.map((trip) => SearchTripByDateModel.fromJson(trip)).toList();
  }
  @override
  Future<String> registerForTrip(int tripId) async {
    try {
      final result = await remoteDataSource.registerForTrip(tripId);
      return result;
    } catch (error) {
      throw Exception('Failed to register for the trip');
    }
  }

}
