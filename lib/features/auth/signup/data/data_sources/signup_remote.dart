import 'dart:convert';
import 'package:e_tourism/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:e_tourism/link_api.dart';

abstract class SignUpRemote {
  Future<Map<String, String>> signUp(String fName, String lName, String email, String password,
      String password_confirmation, String address, String mobile);
}

class SignUpRemoteImpl implements SignUpRemote {
  final http.Client client;

  SignUpRemoteImpl({required this.client});

  @override
  Future<Map<String, String>> signUp(String fName, String lName, String email, String password,
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
      final signUpData = extractLoginDataFromResponse(response.body);
      return signUpData;
    } else if (response.statusCode == 401) {
      throw WrongDataFailureException();
    } else {
      throw ServerException();
    }
  }
  Map<String, String> extractLoginDataFromResponse(String responseBody) {
    final parsed = jsonDecode(responseBody);

    final userData = parsed['data']['user'];
    final token = parsed['data']['token'];
    final typeUser = userData['type_user'];

    print("=======================");
print(parsed);
print(typeUser);
print(token);

    print("=======================");
    return {
      'token': token,
      'type_user':typeUser,
    };
  }
}
