import 'dart:convert';
import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/features/add_for_admin/ads/data/models/admin_ad_model.dart';
import 'package:e_tourism/link_api.dart';
import 'package:http/http.dart' as http;

abstract class AdminAdsDataSource {
  Future<List<AdminAdModel>> fetchAds();

  Future<void> deleteAd(int id);

  Future<void> addAd(String imagePath);
}

class AdminAdsDataSourceImpl implements AdminAdsDataSource {
  final http.Client client;
  final AppPreferences appPreferences;

  AdminAdsDataSourceImpl({required this.client, required this.appPreferences});

  @override
  Future<List<AdminAdModel>> fetchAds() async {
    final token = appPreferences.getUserToken();

    final response = await http.get(
      Uri.parse(AppLink.ADS_ENDPOINT),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return (data)
          .map<AdminAdModel>((ad) => AdminAdModel.fromJson(ad))
          .toList();
    } else {
      throw Exception('Failed to load ads');
    }
  }

  @override
  Future<void> deleteAd(int id) async {
    final token = appPreferences.getUserToken();

    final response = await http.delete(
      Uri.parse('${AppLink.Admin_ADS_ENDPOINT}/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete ad');
    }
  }

  @override
  Future<void> addAd(String imagePath) async {
    final token = appPreferences.getUserToken();

    final request =
        http.MultipartRequest('POST', Uri.parse(AppLink.Admin_ADS_ENDPOINT));
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    request.headers['Authorization'] = 'Bearer $token';

    final response = await request.send();
    if (response.statusCode != 200) {
      throw Exception('Failed to add ad');
    }
  }
}
