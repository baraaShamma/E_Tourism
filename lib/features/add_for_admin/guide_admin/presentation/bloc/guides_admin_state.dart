part of 'guides_admin_bloc.dart';

abstract class GuidesAdminState {}

class GuidesInitial extends GuidesAdminState {}

class GuidesLoading extends GuidesAdminState {}

class GuidesLoaded extends GuidesAdminState {
  final List<GuidesAdminEntity> guides;

  GuidesLoaded(this.guides);
}

class GuidesError extends GuidesAdminState {
  final String message;

  GuidesError(this.message);
}
