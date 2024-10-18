import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/domain/entities/admin_trip.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/domain/use_cases/admin_get_trips_use_case.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/domain/use_cases/delete_trip_use_case.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/domain/use_cases/upload_trip_image_use_case.dart';
import 'package:equatable/equatable.dart';

part 'admin_trips_event.dart';
part 'admin_trips_state.dart';

class AdminTripsBloc extends Bloc<AdminTripsEvent, AdminTripsState> {
  final AdminGetTripsUseCase getTripsUseCase;
  final DeleteTripUseCase deleteTripUseCase;
  final UploadTripImageUseCase uploadTripImageUseCase;

  AdminTripsBloc({required this.getTripsUseCase, required this.deleteTripUseCase, required this.uploadTripImageUseCase}) : super(TripLoadingState()) {
    on<LoadTripsEvent>((event, emit) async {
      emit(TripLoadingState());
      try {
        final trips = await getTripsUseCase();
        emit(TripLoadedState(trips: trips));
      } catch (e) {
        emit(TripErrorState(message: e.toString()));
      }
    });

    on<DeleteTripEvent>((event, emit) async {
      try {
        await deleteTripUseCase(event.id);
        add(LoadTripsEvent());
      } catch (e) {
        emit(TripErrorState(message: e.toString()));
      }
    });
    on<UploadTripImageEvent>((event, emit) async {
      try {
        await uploadTripImageUseCase(event.tripId, event.image);
        emit(TripImageUploadedState());
        final trips = await getTripsUseCase();
        emit(TripLoadedState(trips: trips));
      } catch (e) {
        emit(TripErrorState(message: e.toString()));
      }
    });

  }
}