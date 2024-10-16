import 'dart:convert';

import 'package:e_tourism/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:e_tourism/link_api.dart';

abstract class LoginRemote {
  Future<Map<String, String>> login(String email, String password);
}

class LoginRemoteImpl implements LoginRemote {
  final http.Client client;

  LoginRemoteImpl({required this.client});

  @override
  Future<Map<String, String>> login(String email, String password) async {
    final body = {
      "email": email,
      "password": password,
    };

    final response = await client.post(Uri.parse(AppLink.login), body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final loginData = extractLoginDataFromResponse(response.body);
      return loginData;
    } else if (response.statusCode == 401) {
      throw WrongDataFailureException();
    } else {
      throw ServerException();
    }
  }

  Map<String, String> extractLoginDataFromResponse(String responseBody) {
    final parsed = jsonDecode(responseBody);
    final data = parsed['data'][0];

    return {
      'token': data['token'],
      'type_user': data['type_user'],
    };
  }
}
