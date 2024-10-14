import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:e_tourism/link_api.dart';
abstract class LoginRemote {
  Future<String> login(String email, String password);
}

class LoginRemoteImpl implements LoginRemote {
  final http.Client client;

  LoginRemoteImpl({required this.client});

  @override
  Future<String> login(String email, String password) async {
    final body = {
      "email": email,
      "password": password,
    };

    final response = await client.post(Uri.parse(AppLink.login), body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final token = extractTokenFromResponse(response.body);
      return token;
    } else if (response.statusCode == 401) {
      throw WrongDataFailureException();
    } else {
      throw ServerException();
    }
  }


  String extractTokenFromResponse(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return parsed['data']['token'];
  }
}
