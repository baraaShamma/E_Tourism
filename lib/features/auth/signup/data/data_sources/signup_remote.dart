import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:e_tourism/link_api.dart';

abstract class SignUpRemote {
  Future<Unit> signUp(String fName, String lName, String email, String password,
      String password_confirmation, String address, String mobile);
}

class SignUpRemoteImpl implements SignUpRemote {
  final http.Client client;

  SignUpRemoteImpl({required this.client});

  @override
  Future<Unit> signUp(String fName, String lName, String email, String password,
      String password_confirmation, String address, String mobile) async {
    final body = {
      "fName": fName,
      "lName": lName,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
      "type_user":"tourist",
      "address": address,
      "mobile": mobile,
    };

    final response = await client.post(Uri.parse(AppLink.register), body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Future.value(unit);
    } else if (response.statusCode == 401) {
      throw WrongDataFailureException();
    } else {
      throw ServerException();
    }
  }
}
