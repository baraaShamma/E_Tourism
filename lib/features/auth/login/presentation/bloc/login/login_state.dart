part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final String message;

  const ErrorLoginState({required this.message});

  @override
  List<Object> get props => [message];
}

class SuccessLoginState extends LoginState {
  final String message;
  final String token;

  SuccessLoginState({required this.message, required this.token});
}

