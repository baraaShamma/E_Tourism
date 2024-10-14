import 'package:e_tourism/features/trips/data/data_sources/trips_remote_data_source.dart';
import 'package:e_tourism/features/trips/data/models/trip_model.dart';
import 'package:e_tourism/features/trips/domain/entities/trip.dart';
import 'package:e_tourism/features/trips/domain/repositories/trips_repository.dart';

class TripsRepositoryImpl implements TripsRepository {
  final TripsRemoteDataSource remoteDataSource;

  TripsRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<List<Trip>> getTripsByProgramId(int programId) async {
    final response = await remoteDataSource.fetchTripsByProgramId(programId);
    return response.map((trip) => TripModel.fromJson(trip)).toList();
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
