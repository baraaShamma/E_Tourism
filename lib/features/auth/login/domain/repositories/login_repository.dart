

import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/failures.dart';
import 'package:e_tourism/features/auth/login/domain/entities/login.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>>  login(Login login);

}