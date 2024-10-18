
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/repositories/guide_admin_repository.dart';

class DeleteGuideUseCase {
  final GuidesAdminRepository repository;

  DeleteGuideUseCase(this.repository);

  Future<void> call(int id) {
    return repository.deleteGuide(id);
  }
}
