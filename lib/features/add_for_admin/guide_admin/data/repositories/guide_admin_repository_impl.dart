
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/entities/guide_entity.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/repositories/guide_admin_repository.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/data/data_sources/guide_admin_remote_data_source.dart';

class GuidesAdminRepositoryImpl implements GuidesAdminRepository {
  final GuidesAdminRemoteDataSource remoteDataSource;

  GuidesAdminRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<GuidesAdminEntity>> getGuides() async {
    final guides = await remoteDataSource.getGuides();
    return guides.map((bus) => GuidesAdminEntity.fromModel(bus)).toList();
  }

  @override
  Future<void> addGuide(String fName, String lName, String email, String password,
      String passwordConfirmation, String address, String mobile) {
    return remoteDataSource.addGuide(
        fName, lName, email, password, passwordConfirmation, address, mobile);
  }

  @override
  Future<void> deleteGuide(int id) {
    return remoteDataSource.deleteGuide(id);
  }
}
