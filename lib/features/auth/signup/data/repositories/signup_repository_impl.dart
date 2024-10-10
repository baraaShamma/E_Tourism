import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/exceptions.dart';
import 'package:e_tourism/core/error/failures.dart';
import 'package:e_tourism/core/network/network_info.dart';
import 'package:e_tourism/features/auth/signup/data/data_sources/signup_remote.dart';
import 'package:e_tourism/features/auth/signup/domain/entities/signup.dart';
import 'package:e_tourism/features/auth/signup/domain/repositories/signup_repository.dart';

typedef SignUpPost = Future<Unit> Function();

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemote signUpRemote;
  final NetworkInfo networkInfo;

  SignUpRepositoryImpl({required this.signUpRemote, required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> signUp(SignUp signUp) async {
    return await _getMessage(() {
      return signUpRemote.signUp(
          signUp.fName,
          signUp.lName,
          signUp.email,
          signUp.password,
          signUp.password_confirmation,
          signUp.address,
          signUp.mobile);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(SignUpPost signUpPost) async {
    if (await networkInfo.isConnected) {
      try {
        await signUpPost();
        return const Right(unit);
      } on WrongDataFailureException {
        return Left(WrongDataFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
