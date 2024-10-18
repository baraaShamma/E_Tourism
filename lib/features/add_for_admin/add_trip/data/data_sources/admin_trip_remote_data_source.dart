import 'dart:convert';
import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/data/models/admin_trip_model.dart';
import 'package:e_tourism/link_api.dart';
import 'package:http/http.dart' as http;

abstract class AdminAddTripRemoteDataSource {
  Future<List<AdminTouristProgram>> fetchTouristPrograms();

  Future<List<AdminBus>> fetchBuses();

  Future<List<AdminGuide>> fetchGuides();

  Future<void> addTrip(
    int programId,
    int busId,
    int guideId,
    int price,
    int maxCapacity,
    String tripDate,
  );
}

class AdminAddTripRemoteDataSourceImpl implements AdminAddTripRemoteDataSource {
  final http.Client client;
  final AppPreferences appPreferences;

  AdminAddTripRemoteDataSourceImpl(
      {required this.client, required this.appPreferences});

  @override
  Future<List<AdminTouristProgram>> fetchTouristPrograms() async {
    final token = appPreferences.getUserToken();

    final response = await client.get(
      Uri.parse(AppLink.touristPrograms),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return (json.decode(response.body)['data'] as List)
          .map((program) => AdminTouristProgram.fromJson(program))
          .toList();
    } else {
      throw Exception('Failed to load tourist programs');
    }
  }

  @override
  Future<List<AdminBus>> fetchBuses() async {
    final token = appPreferences.getUserToken();

    final response = await client.get(
      Uri.parse(AppLink.buses),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Parse the JSON and return the list
      return (json.decode(response.body)['data'] as List)
          .map((bus) => AdminBus.fromJson(bus))
          .toList();
    } else {
      throw Exception('Failed to load buses');
    }
  }

  @override
  Future<List<AdminGuide>> fetchGuides() async {
    final token = appPreferences.getUserToken();
    final response = await client.get(
      Uri.parse(AppLink.guidesAdmin),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Parse the JSON and return the list
      return (json.decode(response.body)['data'] as List)
          .map((guide) => AdminGuide.fromJson(guide))
          .toList();
    } else {
      throw Exception('Failed to load guides');
    }
  }

  @override
  Future<void> addTrip(
    int programId,
    int busId,
    int guideId,
    int price,
    int maxCapacity,
    String tripDate,
  ) async {
    final token = appPreferences.getUserToken();
    final response = await client.post(
      Uri.parse(AppLink.tripsAdmin),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'tourist_program_id': programId,
        'bus_id': busId,
        'guide_id': guideId,
        'price': price,
        'max_capacity': maxCapacity,
        'trip_date': tripDate,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add trip');
    }
  }
}
