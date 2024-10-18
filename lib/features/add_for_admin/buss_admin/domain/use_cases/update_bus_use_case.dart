import 'package:e_tourism/features/add_for_admin/buss_admin/domain/repositories/buss_admin_repository.dart';

class UpdateBusUseCase {
  final BussAdminRepository repository;

  UpdateBusUseCase(this.repository);

  Future<void> call(int id, String busStatus) {
    return repository.updateBus(id, busStatus);
  }
}
