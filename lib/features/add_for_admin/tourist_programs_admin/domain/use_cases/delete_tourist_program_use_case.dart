import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/repositories/tourist_programs_admin_repository.dart';

class DeleteTouristProgramUseCase {
  final TouristProgramsAdminRepository repository;

  DeleteTouristProgramUseCase(this.repository);

  Future<void> call(int id) {
    return repository.deleteTouristProgram(id);
  }
}
