part of 'signUp_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}
class ClickButtonSignUpEvent extends SignUpEvent {
  final SignUp signUp;

  const ClickButtonSignUpEvent({required this.signUp});

  @override
  List<Object> get props => [signUp];
}
