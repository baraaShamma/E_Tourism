
import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/link_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BussAdminRemoteDataSource {
  final http.Client client;
  final AppPreferences appPreferences;

  BussAdminRemoteDataSource(
      {required this.client, required this.appPreferences});

  Future<List<dynamic>> getBuss() async {
    final token = appPreferences.getUserToken();
    final response = await http.get(
      Uri.parse('${AppLink.baseUrl}/buses'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load  buss');
    }
  }

  Future<void> addBus(
    String busNumber,
    String busType,
      String seatCount,
  ) async {
    final token = appPreferences.getUserToken();
    print("-----------------");
    print(busNumber);
    print(busType);
    print(seatCount);

    print("-----------------");

    final response = await http.post(
      Uri.parse('${AppLink.baseUrl}/buses'),
      body: {
        "bus_number": busNumber,
        "bus_type": busType,
        "seat_count":seatCount,
        "bus_status": "0"
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print("===========================");
    print(response.body);
    print("===========================");
    if (response.statusCode == 200) {
      // return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load  buss');
    }
  }

  Future<void> updateBus(int id, String busStatus) async {
    final token = appPreferences.getUserToken();

    final response = await http.put(
      Uri.parse('${AppLink.baseUrl}/buses/$id/status'),
      body: {
        'bus_status': busStatus,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update buss');
    }
  }

  Future<void> deleteBus(int id) async {
    final token = appPreferences.getUserToken();

    final response = await http.delete(
      Uri.parse('${AppLink.baseUrl}/buses/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete bus');
    }
  }
}
