

import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/failures.dart';
import 'package:e_tourism/features/auth/signup/domain/entities/signup.dart';

abstract class SignUpRepository {
  Future<Either<Failure, Unit>> signUp(SignUp signUp);

}