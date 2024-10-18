part of 'buss_admin_bloc.dart';

abstract class BussAdminState {}

class BussInitial extends BussAdminState {}

class BussLoading extends BussAdminState {}

class BussLoaded extends BussAdminState {
  final List<BussAdminEntity> buss;

  BussLoaded(this.buss);
}

class BussError extends BussAdminState {
  final String message;

  BussError(this.message);
}
