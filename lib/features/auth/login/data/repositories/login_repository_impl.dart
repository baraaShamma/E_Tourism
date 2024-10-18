import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/exceptions.dart';
import 'package:e_tourism/core/error/failures.dart';
import 'package:e_tourism/features/auth/login/data/datasources/login_remote.dart';
import 'package:e_tourism/features/auth/login/domain/entities/login.dart';
import 'package:e_tourism/features/auth/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemote remoteDataSource;

  LoginRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Map<String, String>>> login(Login login) async {
    try {
      final loginData = await remoteDataSource.login(login.email, login.password);
      return Right(loginData);
    } on WrongDataFailureException {
      return Left(WrongDataFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
