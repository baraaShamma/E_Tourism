import 'package:e_tourism/features/main_view/home/ads/data/data_sources/ads_remote_data_source.dart';

import '../../domain/entities/ad_entity.dart';
import '../../domain/repositories/ads_repository.dart';

class AdsRepositoryImpl implements AdsRepository {
  final AdsRemoteDataSource remoteDataSource;

  AdsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<AdEntity>> getAds() async {
    final ads = await remoteDataSource.fetchAds();
    return ads.map((ad) => AdEntity(id: ad.id, imageUrl: ad.imageUrl)).toList();
  }
}
