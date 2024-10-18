

import 'package:e_tourism/features/add_for_admin/guide_admin/domain/entities/guide_entity.dart';


abstract class GuidesAdminRepository {
  Future<List<GuidesAdminEntity>> getGuides();
  Future<void> addGuide(String fName, String lName, String email, String password,
      String passwordConfirmation, String address, String mobile);
  Future<void> deleteGuide(int id);
}
