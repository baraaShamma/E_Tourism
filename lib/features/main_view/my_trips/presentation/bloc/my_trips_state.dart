part of 'my_trips_bloc.dart';

abstract class MyTripsState extends Equatable {
  const MyTripsState();

  @override
  List<Object> get props => [];
}

class MyTripsInitial extends MyTripsState {}

class TripsLoading extends MyTripsState {}

class TripsLoaded extends MyTripsState {
  final List<MyTrip> trips;

  const TripsLoaded({required this.trips});

  @override
  List<Object> get props => [trips];
}

class TripsError extends MyTripsState {
  final String message;

  const TripsError({required this.message});

  @override
  List<Object> get props => [message];
}

