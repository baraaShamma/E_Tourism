part of 'guides_admin_bloc.dart';

abstract class GuidesAdminEvent {}

class LoadGuides extends GuidesAdminEvent {}

class AddGuides extends GuidesAdminEvent {
  final String fName,
      lName,
      email,
      password,
      passwordConfirmation,
      address,
      mobil;

  AddGuides(this.fName, this.lName, this.email, this.password,
      this.passwordConfirmation, this.address, this.mobil);
}

class DeleteGuide extends GuidesAdminEvent {
  final int id;

  DeleteGuide(this.id);
}
