part of 'trips_bloc.dart';

abstract class TripsState extends Equatable {
  const TripsState();

  @override
  List<Object> get props => [];
}

class TripsInitial extends TripsState {}

class TripsLoading extends TripsState {}

class TripsLoaded extends TripsState {
  final List<Trip> trips;

  const TripsLoaded({required this.trips});

  @override
  List<Object> get props => [trips];
}

class TripsError extends TripsState {
  final String message;

  const TripsError({required this.message});

  @override
  List<Object> get props => [message];
}

class TripRegisteredSuccess extends TripsState {
  final String message;

  const TripRegisteredSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class TripRegisterFailure extends TripsState {
  final String message;

  const TripRegisterFailure({required this.message});

  @override
  List<Object> get props => [message];
}
