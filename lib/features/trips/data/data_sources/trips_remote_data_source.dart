
import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/link_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TripsRemoteDataSource {
  final http.Client client;
  final AppPreferences appPreferences;

  TripsRemoteDataSource({required this.client, required this.appPreferences});

  Future<List<dynamic>> fetchTripsByProgramId(int programId) async {
    final token = appPreferences.getUserToken();

    final response = await client.get(
      Uri.parse(
          '${AppLink.touristPrograms}/$programId/trips'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print("===================");
    print(programId);
    print(response.body);

    print("===================");
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      return data;
    } else {
      throw Exception('Failed to load trips');
    }
  }

  Future registerForTrip(int tripId) async {
    final token = appPreferences.getUserToken();


    final response = await client.post(
      Uri.parse( '${AppLink.trips}/$tripId/register'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);


      return jsonResponse['message'];
    } else {
      throw Exception('فشل التسجيل في الرحلة');
    }
  }
}
