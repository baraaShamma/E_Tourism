part of 'admin_trips_bloc.dart';

abstract class AdminTripsEvent extends Equatable {
  const AdminTripsEvent();

  @override
  List<Object> get props => [];
}

class LoadTripsEvent extends AdminTripsEvent {}

class DeleteTripEvent extends AdminTripsEvent {
  final int id;

  const DeleteTripEvent({required this.id});

  @override
  List<Object> get props => [id];
}
class UploadTripImageEvent extends AdminTripsEvent {
  final String tripId;
  final File image;

  const UploadTripImageEvent({required this.tripId, required this.image});

  @override
  List<Object> get props => [tripId, image];
}
