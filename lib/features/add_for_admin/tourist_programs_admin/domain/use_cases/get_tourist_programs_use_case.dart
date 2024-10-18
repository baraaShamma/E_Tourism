

import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/entities/tourist_program_entity.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/repositories/tourist_programs_admin_repository.dart';

class GetTouristProgramsUseCase {
  final TouristProgramsAdminRepository repository;

  GetTouristProgramsUseCase(this.repository);

  Future<List<TouristProgramAdminEntity>> call() {
    return repository.getTouristPrograms();
  }
}
