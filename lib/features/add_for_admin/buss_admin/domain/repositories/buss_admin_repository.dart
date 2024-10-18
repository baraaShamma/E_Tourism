

import 'package:e_tourism/features/add_for_admin/buss_admin/domain/entities/buss_entity.dart';


abstract class BussAdminRepository {
  Future<List<BussAdminEntity>> getBuss();
  Future<void> addBus(String busNumber, String busType, String seatCount);
  Future<void> updateBus(int id, String busStatus);
  Future<void> deleteBus(int id);
}
