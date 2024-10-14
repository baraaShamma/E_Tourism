
import '../repositories/trips_repository.dart';
import '../entities/trip.dart';

class GetTripsByProgramIdUseCase {
  final TripsRepository repository;

  GetTripsByProgramIdUseCase(this.repository);

  Future<List<Trip>> call(int programId) async {
    return await repository.getTripsByProgramId(programId);
  }
}
