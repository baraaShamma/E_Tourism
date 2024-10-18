import 'package:e_tourism/features/add_for_admin/guide_admin/domain/repositories/guide_admin_repository.dart';

class AddGuideUseCase {
  final GuidesAdminRepository repository;

  AddGuideUseCase(this.repository);

  Future<void> call(String fName, String lName, String email, String password,
      String passwordConfirmation, String address, String mobile) {
    return repository.addGuide(
        fName, lName, email, password, passwordConfirmation, address, mobile);
  }
}
