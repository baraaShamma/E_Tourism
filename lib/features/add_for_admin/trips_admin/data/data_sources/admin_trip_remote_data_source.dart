import 'dart:convert';
import 'dart:io';
import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/data/models/trip_admin_model.dart';
import 'package:e_tourism/link_api.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // To handle file type

abstract class AdminTripRemoteDataSource {
  Future<List<TripModel>> getTrips();

  Future<void> deleteTrip(int id);

  Future<void> uploadTripImage(String tripId, File image); // New method
}

class AdminTripRemoteDataSourceImpl implements AdminTripRemoteDataSource {
  final http.Client client;
  final AppPreferences appPreferences;

  AdminTripRemoteDataSourceImpl(
      {required this.client, required this.appPreferences});

  @override
  Future<List<TripModel>> getTrips() async {
    final token = appPreferences.getUserToken();

    final response = await client.get(
      Uri.parse(AppLink.trips),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((json) => TripModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load trips');
    }
  }

  @override
  Future<void> deleteTrip(int id) async {
    final token = appPreferences.getUserToken();

    final response = await client.delete(
      Uri.parse('${AppLink.tripsAdmin}/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete trip');
    }
  }

  @override
  Future<void> uploadTripImage(String tripId, File image) async {
    final token = appPreferences.getUserToken();

    final uri = Uri.parse('${AppLink.tripsAdmin}/images');
    final request = http.MultipartRequest('POST', uri)
      ..fields['tourist_trip_id'] = tripId
      ..files.add(await http.MultipartFile.fromPath(
        'image',
        image.path,
        contentType: MediaType('image', 'jpeg'),
      ));
    request.headers['Authorization'] = 'Bearer $token';

    final response = await request.send();

    if (response.statusCode != 200) {
      throw Exception('Failed to upload image');
    }
  }
}
