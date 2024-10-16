part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}


class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<SearchTripEntity> trips;
  SearchLoaded(this.trips);
}
class SearchLoadedByDate extends SearchState {
  final List<SearchTripByDateEntity> trips;
  SearchLoadedByDate(this.trips);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
class TripRegisteredSuccess extends SearchState {
  final String message;

   TripRegisteredSuccess({required this.message});
}

class TripRegisterFailure extends SearchState {
  final String message;

   TripRegisterFailure({required this.message});

}
