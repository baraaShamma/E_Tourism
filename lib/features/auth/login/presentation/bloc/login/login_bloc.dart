import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_tourism/Config/injection_container.dart';
import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/core/strings/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:e_tourism/features/auth/login/domain/entities/login.dart';
import 'package:e_tourism/features/auth/login/domain/usecases/login_use_case.dart';
import 'package:e_tourism/core/error/failures.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  AppPreferences appPreferences = instance<AppPreferences>();

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is ClickButtonLoginEvent) {
        emit(LoadingLoginState());

        final failureOrLoginData = await loginUseCase(event.login);
        emit(
          _eitherDoneMessageOrErrorState(failureOrLoginData),
        );
      }
    });
  }

  LoginState _eitherDoneMessageOrErrorState(
      Either<Failure, Map<String, String>> either) {
    return either.fold(
        (failure) => ErrorLoginState(
              message: _mapFailureToMessage(failure),
            ), (loginData) {
      final token = loginData['token']!;
      final typeUser = loginData['type_user']!;

      appPreferences.setUserLoggedIn();
      appPreferences.setUserToken(token);
      appPreferences.setUserType(typeUser);

      return SuccessLoginState(
        message: "Login Successful,",
        token: token,
        typeUser: typeUser,
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case WrongDataFailure:
        return Error_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later.";
    }
  }
}
