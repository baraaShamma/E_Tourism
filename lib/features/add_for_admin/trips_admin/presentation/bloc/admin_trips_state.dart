part of 'admin_trips_bloc.dart';

abstract class AdminTripsState extends Equatable {
  const AdminTripsState();

  @override
  List<Object> get props => [];
}

class TripLoadingState extends AdminTripsState {}

class TripLoadedState extends AdminTripsState {
  final List<Trip> trips;

  const TripLoadedState({required this.trips});

  @override
  List<Object> get props => [trips];
}

class TripErrorState extends AdminTripsState {
  final String message;

  const TripErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class TripImageUploadedState extends AdminTripsState {}
