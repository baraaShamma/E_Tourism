import 'package:e_tourism/features/add_for_admin/ads/domain/repositories/admin_ads_repository_imp.dart';

import '../entities/admin_ad_entity.dart';

class GetAdsAdminUseCase {
  final AdminAdsRepository repository;

  GetAdsAdminUseCase(this.repository);

  Future<List<AdminAdEntity>> call() async {
    return await repository.getAds();
  }
}
