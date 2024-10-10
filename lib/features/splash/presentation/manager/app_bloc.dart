import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_tourism/Config/injection_container.dart';
import 'package:e_tourism/app/app_preferences.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  // SharedPreferences sharedPreferences=instance();
  AppPreferences appPreferences = instance<AppPreferences>();

  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) async {
      // String ?auth = sharedPreferences.getString("type_user");
      if (event is SessionEvent) {
        if (await appPreferences.getUserLoggedIn()) {
          emit(SessionState());
        }
        else{
          emit(NotSessionState());
        }
      }    });
  }
}
