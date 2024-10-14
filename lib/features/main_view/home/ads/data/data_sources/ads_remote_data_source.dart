
import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/core/error/exceptions.dart';
import 'package:e_tourism/features/main_view/home/ads/data/models/ads_model.dart';
import 'package:e_tourism/link_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


abstract class AdsRemoteDataSource {
  Future<List<Ad>> fetchAds();
}

class AdsRemoteDataSourceImpl implements AdsRemoteDataSource {
  final http.Client client;
  final AppPreferences appPreferences;

  AdsRemoteDataSourceImpl({required this.client, required this.appPreferences});

  @override
  Future<List<Ad>> fetchAds() async {
    final token = appPreferences.getUserToken();

    final response = await client.get(
      Uri.parse(AppLink.ADS_ENDPOINT),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List ads = jsonResponse['data'];
      return ads.map((ad) => Ad.fromJson(ad)).toList();
    } else {
      throw ServerException();
    }
  }
}
