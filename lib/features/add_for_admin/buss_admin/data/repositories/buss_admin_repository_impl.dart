
import 'package:e_tourism/features/add_for_admin/buss_admin/data/data_sources/buss_admin_remote_data_source.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/entities/buss_entity.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/repositories/buss_admin_repository.dart';

class BussAdminRepositoryImpl implements BussAdminRepository {
  final BussAdminRemoteDataSource remoteDataSource;

  BussAdminRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<BussAdminEntity>> getBuss() async {
    final buss = await remoteDataSource.getBuss();
    return buss.map((bus) => BussAdminEntity.fromModel(bus)).toList();
  }

  @override
  Future<void> addBus(String busNumber, String busType, String seatCount) {
    return remoteDataSource.addBus(busNumber, busType, seatCount);
  }

  @override
  Future<void> updateBus(int id, String busStatus) {
    return remoteDataSource.updateBus(id, busStatus);
  }

  @override
  Future<void> deleteBus(int id) {
    return remoteDataSource.deleteBus(id);
  }
}
