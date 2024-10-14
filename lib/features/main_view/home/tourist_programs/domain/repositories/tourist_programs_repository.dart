import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/failures.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/entities/tourist_programs_entity.dart';


abstract class TouristProgramsRepository {
  Future<Either<Failure, List<TouristProgramsEntity>>> getAllTouristPrograms();
  Future<TouristProgramsEntity> getTouristProgram(int id);

}
