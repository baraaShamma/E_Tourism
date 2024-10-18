
import 'package:bloc/bloc.dart';
import 'package:e_tourism/features/trips/domain/entities/trip.dart';
import 'package:e_tourism/features/trips/domain/use_cases/get_trips_by_program_id_use_case.dart';
import 'package:e_tourism/features/trips/domain/use_cases/register_for_trip_use_case.dart';
import 'package:equatable/equatable.dart';

part 'trips_event.dart';

part 'trips_state.dart';
class TripsBloc extends Bloc<TripsEvent, TripsState> {
  final GetTripsByProgramIdUseCase getTripsByProgramIdUseCase;
  final RegisterForTripUseCase registerForTripUseCase;

  TripsBloc({
    required this.getTripsByProgramIdUseCase,
    required this.registerForTripUseCase,
  }) : super(TripsInitial()) {

    on<GetTripsByProgramIdEvent>((event, emit) async {
      emit(TripsLoading());
      try {
        final trips = await getTripsByProgramIdUseCase(event.programId);
        emit(TripsLoaded(trips: trips));
      } catch (e) {
        emit(TripsError(message: "لم تقم بالتسجيل في اي رحلة "));
      }
    });

    on<RegisterForTripEvent>((event, emit) async {
      emit(TripsLoading());
      try {
        final result = await registerForTripUseCase(event.tripId);
        emit(TripRegisteredSuccess(message: result));
      } catch (e) {
        emit(TripRegisterFailure(message: e.toString()));
      }
    });
  }
}
