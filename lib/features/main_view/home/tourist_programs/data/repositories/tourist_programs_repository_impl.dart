import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/exceptions.dart';
import 'package:e_tourism/core/error/failures.dart';
import 'package:e_tourism/core/network/network_info.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/data/data_sources/tourist_programs_remote_data_source.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/entities/tourist_programs_entity.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/repositories/tourist_programs_repository.dart';
class TouristProgramsRepositoryImpl implements TouristProgramsRepository {
  final TouristProgramsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TouristProgramsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<TouristProgramsEntity> getTouristProgram(int id) async {
    final programModel = await remoteDataSource.getTouristProgram(id);

    return TouristProgramsEntity(
      id: programModel.id,
      type: programModel.type,
      name: programModel.name,
      description: programModel.description,
      image: programModel.image,
      hasTrips: programModel.hasTrips,
    );
  }
    @override
  Future<Either<Failure, List<TouristProgramsEntity>>>
      getAllTouristPrograms() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTouristPrograms =
            await remoteDataSource.getAllTouristPrograms();
        return Right(remoteTouristPrograms);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
