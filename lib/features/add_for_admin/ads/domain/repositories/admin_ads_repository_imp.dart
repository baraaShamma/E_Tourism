import '../entities/admin_ad_entity.dart';

abstract class AdminAdsRepository {
  Future<List<AdminAdEntity>> getAds();
  Future<void> deleteAd(int id);
  Future<void> addAd(String imagePath);
}
