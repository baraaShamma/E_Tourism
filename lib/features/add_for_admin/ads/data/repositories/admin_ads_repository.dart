import 'package:e_tourism/features/add_for_admin/ads/domain/entities/admin_ad_entity.dart';
import 'package:e_tourism/features/add_for_admin/ads/domain/repositories/admin_ads_repository_imp.dart';

import '../data_sources/admin_ads_data_source.dart';

class AdminAdsRepositoryImpl implements AdminAdsRepository{
  final AdminAdsDataSource dataSource;

  AdminAdsRepositoryImpl(this.dataSource);

  Future<List<AdminAdEntity>> getAds() async {
    return await dataSource.fetchAds();
  }

  Future<void> deleteAd(int id) async {
    return await dataSource.deleteAd(id);
  }

  Future<void> addAd(String imagePath) async {
    return await dataSource.addAd(imagePath);
  }
}
