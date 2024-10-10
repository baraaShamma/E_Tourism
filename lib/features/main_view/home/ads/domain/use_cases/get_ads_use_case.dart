import '../entities/ad_entity.dart';
import '../repositories/ads_repository.dart';

class GetAdsUseCase {
  final AdsRepository repository;

  GetAdsUseCase({required this.repository});

  Future<List<AdEntity>> call() async {
    return await repository.getAds();
  }
}
