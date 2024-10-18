
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_tourism/Config/injection_container.dart';
import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/core/strings/failure.dart';
import 'package:e_tourism/features/auth/signup/domain/entities/signup.dart';
import 'package:e_tourism/features/auth/signup/domain/use_cases/signup_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:e_tourism/core/error/failures.dart';

part 'signUp_event.dart';

part 'signUp_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;
  AppPreferences appPreferences = instance<AppPreferences>();

  SignUpBloc({required this.signUpUseCase}) : super( SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is ClickButtonSignUpEvent) {
        emit(LoadingSignUpState());

        final failureOrSignUpData = await signUpUseCase(event.signUp);
        emit(
          _eitherDoneMessageOrErrorState(failureOrSignUpData),
        );
      }
    });
  }

  SignUpState _eitherDoneMessageOrErrorState(
      Either<Failure, Map<String, String>> either) {
    return either.fold(
        (failure) => ErrorSignUpState(
              message: _mapFailureToMessage(failure),
            ), (signUp) {
      final token = signUp['token']!;
      final typeUser = signUp['type_user']!;

      appPreferences.setUserLoggedIn();
      appPreferences.setUserToken(token);
      appPreferences.setUserType(typeUser);

      return SuccessSignUpState(
        message: "SignUp Successful,",
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
