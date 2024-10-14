part of 'tourist_programs_bloc.dart';

abstract class TouristProgramsEvent extends Equatable {
  const TouristProgramsEvent();

@override
List<Object> get props => [];
}

class GetAllTouristProgramsEvent extends TouristProgramsEvent {}

class GetTouristProgramEventById extends TouristProgramsEvent {
  final int id;

  const GetTouristProgramEventById(this.id);

  @override
  List<Object> get props => [id];
}