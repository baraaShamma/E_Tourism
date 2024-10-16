part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchByNameEvent extends SearchEvent {
  final String name;
  SearchByNameEvent(this.name);
}

class SearchByDatesEvent extends SearchEvent {
  final String startDate;
  final String endDate;
  SearchByDatesEvent(this.startDate, this.endDate);
}
class RegisterForTripEvent extends SearchEvent {
  final int tripId;

  RegisterForTripEvent({required this.tripId});
}