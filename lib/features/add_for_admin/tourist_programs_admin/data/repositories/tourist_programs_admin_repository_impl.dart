

import 'dart:io';

import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/data/data_sources/tourist_programs_admin_remote_data_source.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/entities/tourist_program_entity.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/repositories/tourist_programs_admin_repository.dart';

class TouristProgramsAdminRepositoryImpl implements TouristProgramsAdminRepository {
  final TouristProgramsAdminRemoteDataSource remoteDataSource;

  TouristProgramsAdminRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<TouristProgramAdminEntity>> getTouristPrograms() async {
    final programs = await remoteDataSource.getTouristPrograms();
    return programs.map((program) => TouristProgramAdminEntity.fromModel(program)).toList();
  }

  @override
  Future<void> addTouristProgram(String type, String name, String description, File imagePath) {
    return remoteDataSource.addTouristProgram(type, name, description, imagePath);
  }

  @override
  Future<void> updateTouristProgram(int id, String type, String name, String description) {
    return remoteDataSource.updateTouristProgram(id, type, name, description);
  }

  @override
  Future<void> deleteTouristProgram(int id) {
    return remoteDataSource.deleteTouristProgram(id);
  }
}
