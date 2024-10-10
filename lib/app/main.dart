import 'package:e_tourism/core/localization/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'bloc_observer.dart';
import 'package:e_tourism/Config/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  Bloc.observer = MyBlocObserver();

  await di.init();

  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'assets/lang',
      child: const MyApp(),
    ),
  );
}
