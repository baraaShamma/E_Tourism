
import '../entities/trip.dart';

abstract class TripsRepository {
  Future<List<Trip>> getTripsByProgramId(int programId);
  Future<String> registerForTrip(int tripId);

}
