

import 'package:dartz/dartz.dart';
import 'package:e_tourism/features/auth/login/domain/entities/login.dart';
import 'package:e_tourism/features/auth/login/domain/repositories/login_repository.dart';
import 'package:e_tourism/core/error/failures.dart';
class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, Map<String, String>>> call(Login login) async {
    return await repository.login(login);
  }
}
