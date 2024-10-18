import 'package:e_tourism/features/add_for_admin/guide_admin/domain/entities/guide_entity.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/repositories/guide_admin_repository.dart';

class GetGuidesUseCase {
  final GuidesAdminRepository repository;

  GetGuidesUseCase(this.repository);

  Future<List<GuidesAdminEntity>> call() {
    return repository.getGuides();
  }
}
