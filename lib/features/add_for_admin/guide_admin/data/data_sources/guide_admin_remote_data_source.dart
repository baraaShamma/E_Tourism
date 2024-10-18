
import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/link_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GuidesAdminRemoteDataSource {
  final http.Client client;
  final AppPreferences appPreferences;

  GuidesAdminRemoteDataSource(
      {required this.client, required this.appPreferences});

  Future<List<dynamic>> getGuides() async {
    final token = appPreferences.getUserToken();
    final response = await http.get(
      Uri.parse('${AppLink.baseUrl}/admin/guides'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load  guides');
    }
  }

  Future<void> addGuide(
    String fName,
    String lName,
    String email,
    String password,
    String passwordConfirmation,
    String address,
    String mobile,
  ) async {
    final response = await http.post(
      Uri.parse('${AppLink.baseUrl}/register'),
      body: {
        "fName": fName,
        "lName": lName,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "type_user": "guide",
        "address": address,
        "mobile": mobile,
      },
    );
    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to load  guides');
    }
  }

  Future<void> deleteGuide(int id) async {
    final token = appPreferences.getUserToken();

    final response = await http.delete(
      Uri.parse('${AppLink.baseUrl}/admin/guides/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete guide');
    }
  }
}
