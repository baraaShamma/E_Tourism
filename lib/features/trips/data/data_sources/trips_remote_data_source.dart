
import 'package:e_tourism/app/app_preferences.dart';
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
          'http://192.168.1.109:8000/api/tourist-programs/$programId/trips'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
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
      Uri.parse( 'http://192.168.1.109:8000/api/trips/$tripId/register'),
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
