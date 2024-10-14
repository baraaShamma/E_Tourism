import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/failures.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/entities/tourist_programs_entity.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/repositories/tourist_programs_repository.dart';

class GetTouristProgramsUseCases {
  final TouristProgramsRepository repository;

  GetTouristProgramsUseCases(this.repository);

  Future<Either<Failure, List<TouristProgramsEntity>>> call() async {
    return await repository.getAllTouristPrograms();
  }
}
