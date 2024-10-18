import 'package:e_tourism/features/add_for_admin/trips_admin/domain/repositories/admin_trip_repository.dart';

class DeleteTripUseCase {
  final AdminTripRepository repository;

  DeleteTripUseCase(this.repository);

  Future<void> call(int id) async {
    return await repository.deleteTrip(id);
  }
}
