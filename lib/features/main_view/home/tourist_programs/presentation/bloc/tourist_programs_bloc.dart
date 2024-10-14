import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_tourism/core/error/failures.dart';
import 'package:e_tourism/core/util/map_failure_to_message.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/entities/tourist_programs_entity.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/use_cases/get_tourist_program_id_use_case.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/use_cases/get_tourist_programs_use_cases.dart';
import 'package:equatable/equatable.dart';

part 'tourist_programs_event.dart';

part 'tourist_programs_state.dart';

class TouristProgramsBloc
    extends Bloc<TouristProgramsEvent, TouristProgramsState> {
  final GetTouristProgramsUseCases getTouristProgramsUseCases;
  final GetTouristProgramByIdUseCase getTouristProgramByIdUseCase;

  TouristProgramsBloc({
    required this.getTouristProgramsUseCases,
    required this.getTouristProgramByIdUseCase,
  }) : super(TouristProgramsInitial()) {
    on<TouristProgramsEvent>(
      (event, emit) async {
        if (event is GetAllTouristProgramsEvent) {
          emit(LoadingTouristProgramsState());
          final failureOrDone = await getTouristProgramsUseCases();
          emit(_mapFailureOrDoneToState(failureOrDone));
        } else if (event is GetTouristProgramEventById) {
          emit(LoadingTouristProgramsState());
          final program = await getTouristProgramByIdUseCase(event.id);
          emit(TouristProgramLoadedById(program));
        }
      },
    );
  }

  TouristProgramsState _mapFailureOrDoneToState(
      Either<Failure, List<TouristProgramsEntity>> either) {
    return either.fold(
      (failure) =>
          ErrorTouristProgramsState(message: mapFailureToMessage(failure)),
      (touristProgramsEntity) => LoadedTouristProgramsState(
        touristProgramsEntity: touristProgramsEntity,
      ),
    );
  }
}
