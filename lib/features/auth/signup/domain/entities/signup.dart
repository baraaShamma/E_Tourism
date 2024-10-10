import 'package:equatable/equatable.dart';

class SignUp extends Equatable {
  String fName;
  String lName;
  String email;
  String password;
  String password_confirmation;
  String address;
  String mobile;

  SignUp({
    required this.fName,
    required this.lName,
    required this.email,
    required this.password,
    required this.password_confirmation,
    required this.address,
    required this.mobile,
  });

  @override
  List<Object?> get props =>
      [fName, lName, email, password, password_confirmation, address, mobile];
}
