import 'dart:io';

import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/repositories/tourist_programs_admin_repository.dart';

class AddTouristProgramUseCase {
  final TouristProgramsAdminRepository repository;

  AddTouristProgramUseCase(this.repository);

  Future<void> call(String type, String name, String description, File imagePath) {
    return repository.addTouristProgram(type, name, description, imagePath);
  }
}
