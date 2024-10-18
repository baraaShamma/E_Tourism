

import 'package:e_tourism/features/add_for_admin/add_trip/data/models/admin_trip_model.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/repositories/admin_trip_repository.dart';

class GetAdminTouristProgramsUseCase {
  final AdminAddTripRepository repository;

  GetAdminTouristProgramsUseCase(this.repository);

  Future<List<AdminTouristProgram>> execute() async {
    return await repository.getTouristPrograms();
  }
}
