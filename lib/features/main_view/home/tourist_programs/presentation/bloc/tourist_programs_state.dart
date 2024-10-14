part of 'tourist_programs_bloc.dart';

abstract class TouristProgramsState extends Equatable {
  const TouristProgramsState();
  @override
  List<Object> get props => [];
}

class TouristProgramsInitial extends TouristProgramsState {
}

class LoadingTouristProgramsState extends TouristProgramsState {}

class LoadedTouristProgramsState extends TouristProgramsState {
  final List<TouristProgramsEntity> touristProgramsEntity;

  const LoadedTouristProgramsState({required this.touristProgramsEntity});

  @override
  List<Object> get props => [touristProgramsEntity];
}

class ErrorTouristProgramsState extends TouristProgramsState {
  final String message;

  const ErrorTouristProgramsState({required this.message});

  @override
  List<Object> get props => [message];
}
class TouristProgramLoadedById extends TouristProgramsState {
  final TouristProgramsEntity program;

  const TouristProgramLoadedById(this.program);

  @override
  List<Object> get props => [program];
}