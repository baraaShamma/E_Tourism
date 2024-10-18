part of 'admin_add_trip_bloc.dart';

abstract class AdminAddTripEvent extends Equatable {
  const AdminAddTripEvent();

  @override
  List<Object> get props => [];
}

class LoadAdminTripData extends AdminAddTripEvent {}

class AddTrip extends AdminAddTripEvent {
  final AdminTripEntity tripEntity;

  const AddTrip({required this.tripEntity});

  @override
  List<Object> get props => [tripEntity];
}
