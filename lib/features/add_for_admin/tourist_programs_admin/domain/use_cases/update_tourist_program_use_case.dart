import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/repositories/tourist_programs_admin_repository.dart';

class UpdateTouristProgramUseCase {
  final TouristProgramsAdminRepository repository;

  UpdateTouristProgramUseCase(this.repository);

  Future<void> call(int id, String type, String name, String description) {
    return repository.updateTouristProgram(id, type, name, description);
  }
}
