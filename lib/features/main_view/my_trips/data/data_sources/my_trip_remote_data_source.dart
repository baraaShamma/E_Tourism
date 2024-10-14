import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/features/main_view/my_trips/data/models/my_trip_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_tourism/link_api.dart';

abstract class MyTripRemoteDataSource {
  Future<List<MyTripModel>> getRegisteredTrips();
}

class MyTripRemoteDataSourceImpl implements MyTripRemoteDataSource {
  final http.Client client;
  final AppPreferences appPreferences;

  MyTripRemoteDataSourceImpl(
      {required this.client, required this.appPreferences});

  @override
  Future<List<MyTripModel>> getRegisteredTrips() async {
    final token = appPreferences.getUserToken();

    final response = await client.get(
      Uri.parse(AppLink.getRegisteredTrips),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final List<dynamic> tripsJson = json.decode(response.body)['trips'];
      return tripsJson.map((json) => MyTripModel.fromJson(json)).toList();
    }
    else {
      throw Exception('Failed to load trips');
    }
  }
}
