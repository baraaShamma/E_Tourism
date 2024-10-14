import 'dart:convert';

import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/core/error/exceptions.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/data/models/tourist_programs_model.dart';
import 'package:e_tourism/link_api.dart';
import 'package:http/http.dart' as http;

abstract class TouristProgramsRemoteDataSource {
  Future<List<TouristProgramsModel>> getAllTouristPrograms();
  Future<TouristProgramsModel> getTouristProgram(int id);

}

class TouristProgramsRemoteDataSourceImpl
    implements TouristProgramsRemoteDataSource {
  final http.Client client;
  final AppPreferences appPreferences;

  TouristProgramsRemoteDataSourceImpl(
      {required this.client, required this.appPreferences});

  @override
  Future<List<TouristProgramsModel>> getAllTouristPrograms() async {
    final token = appPreferences.getUserToken();

    final response = await client.get(
      Uri.parse(AppLink.touristPrograms),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final List touristPrograms = decodedJson['data'];

      return touristPrograms
          .map((touristPrograms) =>
              TouristProgramsModel.fromJson(touristPrograms))
          .toList();
    } else {
      throw ServerException();
    }
  }
  @override
  Future<TouristProgramsModel> getTouristProgram(int id) async {
    final token = appPreferences.getUserToken();
    final response = await client.get(
      Uri.parse("${AppLink.touristPrograms}/$id"),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'];

      return TouristProgramsModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load program');
    }
  }
}
