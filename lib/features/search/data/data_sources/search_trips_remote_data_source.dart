import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/link_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchTripsRemoteDataSource {
  final http.Client client;
  final AppPreferences appPreferences;

  SearchTripsRemoteDataSource(
      {required this.client, required this.appPreferences});

  Future<List<dynamic>> searchTripsByName(String name) async {
    final token = appPreferences.getUserToken();
    final body = {
      "name": name,
    };
    final response = await client.post(
      Uri.parse('${AppLink.trips}/search'),
      body: body,
      headers: {
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

  Future<List<dynamic>> searchTripsByDate(
      String startDate, String endDate) async {
    final token = appPreferences.getUserToken();
    final body = {
      "start_date": startDate,
      "end_date": endDate,
    };
    final url = Uri.parse('${AppLink.trips}/dates');
    final response = await client.post(
      url,
      body: body,
      headers: {
        'Accept':'application/json',
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
