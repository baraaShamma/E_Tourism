

import 'package:e_tourism/features/add_for_admin/buss_admin/domain/repositories/buss_admin_repository.dart';

class AddBusUseCase {
  final BussAdminRepository repository;

  AddBusUseCase(this.repository);

  Future<void> call(String busNumber, String busType, String seatCount,) {

    return repository.addBus(busNumber, busType, seatCount);
  }
}
