part of 'tourist_programs_admin__bloc.dart';

abstract class TouristProgramsAdminEvent {}
class LoadTouristPrograms extends TouristProgramsAdminEvent {}
class AddTouristProgram extends TouristProgramsAdminEvent {
  final String type, name, description;
  final File imagePath;
  AddTouristProgram(this.type, this.name, this.description, this.imagePath);
}
class UpdateTouristProgram extends TouristProgramsAdminEvent {
  final int id;
  final String type, name, description;
  UpdateTouristProgram(this.id, this.type, this.name, this.description);
}
class DeleteTouristProgram extends TouristProgramsAdminEvent {
  final int id;
  DeleteTouristProgram(this.id);
}
