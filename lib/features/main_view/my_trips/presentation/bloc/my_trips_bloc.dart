import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_tourism/features/main_view/my_trips/domain/entities/my_trip.dart';
import 'package:e_tourism/features/main_view/my_trips/domain/use_cases/get_registered_trips_use_case.dart';
import 'package:equatable/equatable.dart';

part 'my_trips_event.dart';
part 'my_trips_state.dart';

class MyTripsBloc extends Bloc<MyTripsEvent, MyTripsState> {
  final GetRegisteredTripsUseCase getRegisteredTripsUseCase;

  MyTripsBloc({required this.getRegisteredTripsUseCase}) : super(MyTripsInitial()) {
    on<LoadRegisteredTripsEvent>((event, emit) async {
      emit(TripsLoading());
      try {
        final trips = await getRegisteredTripsUseCase();
        emit(TripsLoaded(trips: trips));
      } catch (e) {
        emit(TripsError(message: e.toString()));
      }
    });
  }
}
