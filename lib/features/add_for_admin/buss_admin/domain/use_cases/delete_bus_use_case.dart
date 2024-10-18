
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/repositories/buss_admin_repository.dart';

class DeleteBusUseCase {
  final BussAdminRepository repository;

  DeleteBusUseCase(this.repository);

  Future<void> call(int id) {
    return repository.deleteBus(id);
  }
}
