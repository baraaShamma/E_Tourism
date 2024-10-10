part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class SessionState extends AppState{}
class NotSessionState extends AppState{}
