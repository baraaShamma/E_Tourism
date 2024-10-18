import 'dart:io';

import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/link_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mime/mime.dart';

class TouristProgramsAdminRemoteDataSource {
  final http.Client client;
  final AppPreferences appPreferences;

  TouristProgramsAdminRemoteDataSource(
      {required this.client, required this.appPreferences});

  Future<List<dynamic>> getTouristPrograms() async {
    final token = appPreferences.getUserToken();

    final response = await http.get(
      Uri.parse('${AppLink.baseUrl}/tourist-programs'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load tourist programs');
    }
  }

  Future<void> addTouristProgram(
    String type,
    String name,
    String description,
    File image,
  ) async {
    final token = appPreferences.getUserToken();

    final uri = Uri.parse(
      AppLink.touristPrograms,
    );
    final request = http.MultipartRequest(
      'POST',
      uri,
    );
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['type'] = type;
    request.fields['name'] = name;
    request.fields['description'] = description;

    final mimeType = lookupMimeType(image.path);
    if (mimeType != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        image.path,
      ));
    }
    final response = await request.send();

    if (response.statusCode != 200) {
      throw Exception('Failed to add tourist program');
    }
  }

  Future<void> updateTouristProgram(
      int id, String type, String name, String description) async {
    final token = appPreferences.getUserToken();

    final response = await http.put(
      Uri.parse('${AppLink.baseUrl}/tourist-programs/$id'),
      body: {
        'type': type,
        'name': name,
        'description': description,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update tourist program');
    }
  }

  Future<void> deleteTouristProgram(int id) async {
    final token = appPreferences.getUserToken();

    final response = await http.delete(
      Uri.parse('${AppLink.baseUrl}/tourist-programs/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete tourist program');
    }
  }
}
