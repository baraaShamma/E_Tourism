

import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/failures.dart';
import 'package:e_tourism/features/auth/signup/domain/entities/signup.dart';
import 'package:e_tourism/features/auth/signup/domain/repositories/signup_repository.dart';

class LoginUseCase {
  final SignUpRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, Unit>> call(SignUp signUp) async {
    return await repository.signUp(signUp);
  }
}
