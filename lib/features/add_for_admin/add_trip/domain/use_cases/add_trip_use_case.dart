

import 'package:e_tourism/features/add_for_admin/add_trip/domain/entities/admin_trip_entities.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/repositories/admin_trip_repository.dart';

class AddTripUseCase {
  final AdminAddTripRepository repository;

  AddTripUseCase(this.repository);

  Future<void> execute(AdminTripEntity tripEntity) async {
    return await repository.addTrip(tripEntity);
  }
}
