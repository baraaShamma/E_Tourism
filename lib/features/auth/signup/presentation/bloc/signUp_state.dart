part of 'signUp_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class LoadingSignUpState extends SignUpState {}

class ErrorSignUpState extends SignUpState {
  final String message;

  const ErrorSignUpState({required this.message});

  @override
  List<Object> get props => [message];
}

class SuccessSignUpState extends SignUpState {
  final String message;
  final String token;
  final String typeUser;

  SuccessSignUpState({
    required this.message,
    required this.token,
    required this.typeUser,
  });

  @override
  List<Object> get props => [message, token, typeUser];
}
