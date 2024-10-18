import 'package:e_tourism/features/add_for_admin/ads/domain/repositories/admin_ads_repository_imp.dart';

class DeleteAdUseCase {
  final AdminAdsRepository repository;

  DeleteAdUseCase(this.repository);

  Future<void> call(int id) async {
    await repository.deleteAd(id);
  }
}


