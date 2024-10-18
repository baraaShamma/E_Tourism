part of 'buss_admin_bloc.dart';

abstract class BussAdminEvent {}

class LoadBuss extends BussAdminEvent {}

class AddBus extends BussAdminEvent {
  final String busNumber, busType;
  final String seatCount;

  AddBus(this.busNumber, this.busType, this.seatCount);
}

class UpdateBus extends BussAdminEvent {
  final int id;
  final String busStatus;

  UpdateBus(this.id, this.busStatus);

}

class DeleteBus extends BussAdminEvent {
  final int id;

  DeleteBus(this.id);
}
