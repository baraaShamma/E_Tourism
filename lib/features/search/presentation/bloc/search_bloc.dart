import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_tourism/features/search/domain/entities/search_trip_by_date_entity.dart';
import 'package:e_tourism/features/search/domain/entities/search_trip_entity.dart';
import 'package:e_tourism/features/search/domain/use_cases/register_for_trip_search_use_case.dart';
import 'package:e_tourism/features/search/domain/use_cases/search_trips_by_dates.dart';
import 'package:e_tourism/features/search/domain/use_cases/search_trips_by_name.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTripsByName searchByName;
  final SearchTripsByDates searchByDates;
  final RegisterForTripSearchUseCase registerForTripUseCase;

  SearchBloc({
    required this.searchByName,
    required this.searchByDates,
    required this.registerForTripUseCase,
  }) :super(SearchInitial()) {
    on<SearchByNameEvent>((event, emit) async {
      emit(SearchLoading());
      try {
      final trips = await searchByName(event.name);
        emit(SearchLoaded(trips));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });

    on<SearchByDatesEvent>((event, emit) async {
      emit(SearchLoading());
      try {
        final trips = await searchByDates(event.startDate, event.endDate);
        emit(SearchLoadedByDate(trips));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
    on<RegisterForTripEvent>((event, emit) async {
      emit(SearchLoading());
      try {
        final result = await registerForTripUseCase(event.tripId);
        emit(TripRegisteredSuccess(message: result));
      } catch (e) {
        emit(TripRegisterFailure(message: e.toString()));
      }
    });

  }
}
