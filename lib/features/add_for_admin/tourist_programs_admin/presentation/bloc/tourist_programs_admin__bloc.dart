import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/entities/tourist_program_entity.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/use_cases/add_tourist_program_use_case.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/use_cases/delete_tourist_program_use_case.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/use_cases/get_tourist_programs_use_case.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/use_cases/update_tourist_program_use_case.dart';

part 'tourist_programs_admin__event.dart';
part 'tourist_programs_admin__state.dart';

class TouristProgramsAdminBloc extends Bloc<TouristProgramsAdminEvent, TouristProgramsAdminState> {
  final GetTouristProgramsUseCase getTouristProgramsUseCase;
  final AddTouristProgramUseCase addTouristProgramUseCase;
  final UpdateTouristProgramUseCase updateTouristProgramUseCase;
  final DeleteTouristProgramUseCase deleteTouristProgramUseCase;

  TouristProgramsAdminBloc({
    required this.getTouristProgramsUseCase,
    required this.addTouristProgramUseCase,
    required this.updateTouristProgramUseCase,
    required this.deleteTouristProgramUseCase,
  }) : super(TouristProgramsInitial()) {
    on<LoadTouristPrograms>((event, emit) async {
      emit(TouristProgramsLoading());
      try {
        final programs = await getTouristProgramsUseCase();
        emit(TouristProgramsLoaded(programs));
      } catch (e) {
        emit(TouristProgramsError(e.toString()));
      }
    });

    on<AddTouristProgram>((event, emit) async {
      emit(TouristProgramsLoading());
      try {
        await addTouristProgramUseCase(event.type, event.name, event.description, event.imagePath);
        final programs = await getTouristProgramsUseCase();
        emit(TouristProgramsLoaded(programs));
      } catch (e) {
        emit(TouristProgramsError(e.toString()));
      }
    });

    on<UpdateTouristProgram>((event, emit) async {
      emit(TouristProgramsLoading());
      try {
        await updateTouristProgramUseCase(event.id, event.type, event.name, event.description);
        final programs = await getTouristProgramsUseCase();
        emit(TouristProgramsLoaded(programs));
      } catch (e) {
        emit(TouristProgramsError(e.toString()));
      }
    });

    on<DeleteTouristProgram>((event, emit) async {
      emit(TouristProgramsLoading());
      try {
        await deleteTouristProgramUseCase(event.id);
        final programs = await getTouristProgramsUseCase();
        emit(TouristProgramsLoaded(programs));
      } catch (e) {
        emit(TouristProgramsError(e.toString()));
      }
    });
  }
}