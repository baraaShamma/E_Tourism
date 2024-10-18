part of 'tourist_programs_admin__bloc.dart';

abstract class TouristProgramsAdminState {}
class TouristProgramsInitial extends TouristProgramsAdminState {}
class TouristProgramsLoading extends TouristProgramsAdminState {}
class TouristProgramsLoaded extends TouristProgramsAdminState {
  final List<TouristProgramAdminEntity> programs;
  TouristProgramsLoaded(this.programs);
}
class TouristProgramsError extends TouristProgramsAdminState {
  final String message;
  TouristProgramsError(this.message);
}
