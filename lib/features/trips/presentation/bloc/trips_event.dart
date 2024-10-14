part of 'trips_bloc.dart';

abstract class TripsEvent extends Equatable {
  const TripsEvent();

  @override
  List<Object> get props => [];
}

class GetTripsByProgramIdEvent extends TripsEvent {
  final int programId;

  GetTripsByProgramIdEvent(this.programId);

  @override
  List<Object> get props => [programId];
}

class RegisterForTripEvent extends TripsEvent {
  final int tripId;

  RegisterForTripEvent({required this.tripId});

  @override
  List<Object> get props => [tripId];
}
