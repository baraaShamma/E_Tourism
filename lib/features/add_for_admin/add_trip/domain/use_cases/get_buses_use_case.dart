

import 'package:e_tourism/features/add_for_admin/add_trip/data/models/admin_trip_model.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/repositories/admin_trip_repository.dart';

class GetBusesUseCase {
  final AdminAddTripRepository repository;

  GetBusesUseCase(this.repository);

  Future<List<AdminBus>> execute() async {
    return await repository.getBuses();
  }
}
