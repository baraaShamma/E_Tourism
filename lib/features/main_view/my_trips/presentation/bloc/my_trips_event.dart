part of 'my_trips_bloc.dart';
abstract class MyTripsEvent extends Equatable {
  const MyTripsEvent();

  @override
  List<Object> get props => [];
}

class LoadRegisteredTripsEvent extends MyTripsEvent {

  const LoadRegisteredTripsEvent();

  @override
  List<Object> get props => [];
}