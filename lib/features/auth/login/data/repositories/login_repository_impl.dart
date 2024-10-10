import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/exceptions.dart';
import 'package:e_tourism/core/error/failures.dart';
import 'package:e_tourism/core/network/network_info.dart';
import 'package:e_tourism/features/auth/login/data/datasources/login_remote.dart';
import 'package:e_tourism/features/auth/login/domain/entities/login.dart';
import 'package:e_tourism/features/auth/login/domain/repositories/login_repository.dart';
typedef LoginPost = Future<String> Function(); // تعديل الـ typedef ليعيد String بدلاً من Unit

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemote loginRemote;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({
    required this.loginRemote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> login(Login login) async {
    return await _getMessage(() {
      return loginRemote.login(login.email, login.password);
    });
  }

  Future<Either<Failure, String>> _getMessage(LoginPost loginPost) async {
    if (await networkInfo.isConnected) {
      try {
        final token = await loginPost(); // نحصل على الـ token
        return Right(token); // نعيد الـ token بدلاً من unit
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
