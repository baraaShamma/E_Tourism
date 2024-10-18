import 'package:e_tourism/features/add_for_admin/ads/domain/repositories/admin_ads_repository_imp.dart';

class AddAdUseCase {
  final AdminAdsRepository repository;

  AddAdUseCase(this.repository);

  Future<void> call(String imagePath) async {
    await repository.addAd(imagePath);
  }
}