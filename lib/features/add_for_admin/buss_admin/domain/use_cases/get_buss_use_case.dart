


import 'package:e_tourism/features/add_for_admin/buss_admin/domain/entities/buss_entity.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/repositories/buss_admin_repository.dart';

class GetBussUseCase {
  final BussAdminRepository repository;

  GetBussUseCase(this.repository);

  Future<List<BussAdminEntity>> call() {
    return repository.getBuss();
  }
}
