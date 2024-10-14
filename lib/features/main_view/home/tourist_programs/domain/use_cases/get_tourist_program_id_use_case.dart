

import 'package:e_tourism/features/main_view/home/tourist_programs/domain/entities/tourist_programs_entity.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/repositories/tourist_programs_repository.dart';

class GetTouristProgramByIdUseCase {
  final TouristProgramsRepository repository;

  GetTouristProgramByIdUseCase(this.repository);

  Future<TouristProgramsEntity> call(int id) {
    return repository.getTouristProgram(id);
  }
}
