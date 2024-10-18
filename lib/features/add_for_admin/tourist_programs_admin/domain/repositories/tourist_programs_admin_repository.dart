
import 'dart:io';

import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/entities/tourist_program_entity.dart';

abstract class TouristProgramsAdminRepository {
  Future<List<TouristProgramAdminEntity>> getTouristPrograms();
  Future<void> addTouristProgram(String type, String name, String description, File imagePath);
  Future<void> updateTouristProgram(int id, String type, String name, String description);
  Future<void> deleteTouristProgram(int id);
}
