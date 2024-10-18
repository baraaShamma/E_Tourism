import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/exceptions.dart';
import 'package:e_tourism/core/error/failures.dart';
import 'package:e_tourism/features/auth/signup/data/data_sources/signup_remote.dart';
import 'package:e_tourism/features/auth/signup/domain/entities/signup.dart';
import 'package:e_tourism/features/auth/signup/domain/repositories/signup_repository.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemote signUpRemote;

  SignUpRepositoryImpl({required this.signUpRemote});

  @override
  Future<Either<Failure, Map<String, String>>> signUp(SignUp signUp) async {
    try {
      final signUpData = await signUpRemote.signUp(
          signUp.fName,
          signUp.lName,
          signUp.email,
          signUp.password,
          signUp.password_confirmation,
          signUp.address,
          signUp.mobile);
      return Right(signUpData);
    } on WrongDataFailureException {
      return Left(WrongDataFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
