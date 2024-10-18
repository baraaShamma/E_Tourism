part of 'admin_add_trip_bloc.dart';

abstract class AdminAddTripState extends Equatable {
  @override
  List<Object> get props => [];
}

class AdminAddTripInitial extends AdminAddTripState {}

class AdminAddTripLoading extends AdminAddTripState {}


class AdminAddDataLoaded extends AdminAddTripState {
  final List<TouristProgramEntity> programs;
  final List<BusEntity> buses;
  final List<GuideEntity> guides;

  AdminAddDataLoaded(this.programs, this.buses, this.guides);

  @override
  List<Object> get props => [programs,buses,guides];
}


class AdminAddTripAdded extends AdminAddTripState {}

class AdminAddTripError extends AdminAddTripState {
  final String message;

  AdminAddTripError(this.message);

  @override
  List<Object> get props => [message];
}