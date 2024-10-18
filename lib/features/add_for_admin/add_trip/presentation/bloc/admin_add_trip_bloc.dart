import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/entities/admin_bus_entity.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/entities/admin_guide_entity.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/entities/admin_tourist_program_entity.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/entities/admin_trip_entities.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/use_cases/add_trip_use_case.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/use_cases/get_buses_use_case.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/use_cases/get_guides_use_case.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/use_cases/get_tourist_programs_use_case.dart';
import 'package:equatable/equatable.dart';

part 'admin_add_trip_event.dart';

part 'admin_add_trip_state.dart';

class AdminAddTripBloc extends Bloc<AdminAddTripEvent, AdminAddTripState> {
  final AddTripUseCase addTripUseCase;
  final GetAdminTouristProgramsUseCase getTouristProgramsUseCase;
  final GetBusesUseCase getBusesUseCase;
  final GetAdminGuidesUseCase getGuidesUseCase;

  AdminAddTripBloc({
    required this.addTripUseCase,
    required this.getTouristProgramsUseCase,
    required this.getBusesUseCase,
    required this.getGuidesUseCase,
  }) : super(AdminAddTripInitial()) {
    on<LoadAdminTripData>((event, emit) async {
      emit(AdminAddTripLoading());
      try {
        final programs = await getTouristProgramsUseCase.execute();
        final touristPrograms =
        programs.map((program) => program.toEntity()).toList();
        final buses = await getBusesUseCase.execute();
        final busEntities = buses.map((bus) => bus.toEntity()).toList();
        final guides = await getGuidesUseCase.execute();
        final guideEntities =
        guides.map((guide) => guide.toEntity()).toList();
        emit(AdminAddDataLoaded(touristPrograms, busEntities, guideEntities));
      } catch (e) {
        emit(AdminAddTripError('Failed to load tourist programs'));
      }
    });

    on<AddTrip>((event, emit) async {
      emit(AdminAddTripLoading());
      try {
        await addTripUseCase.execute(event.tripEntity);
        emit(AdminAddTripAdded());
      } catch (e) {
        emit(AdminAddTripError('Failed to add trip'));
      }
    });


  }
}
