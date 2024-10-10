import 'dart:async';

import 'package:e_tourism/Config/navigation/app_route.dart';
import 'package:e_tourism/core/constant/image_assets.dart';
import 'package:e_tourism/features/splash/presentation/manager/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AppBloc appBloc;

  @override
  void initState() {
    appBloc = AppBloc()..add(SessionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: appBloc,
        listener: (context, state) async {
          if (state is SessionState) {
            // context.goNamed(RoutesNames.postsScreen);
            Timer(const Duration(seconds: 1),() {
            context.goNamed(RoutesNames.MainView);
            });
          } else if (state is NotSessionState) {
            Timer(const Duration(seconds: 1),() {
              context.goNamed(RoutesNames.loginScreen);
            });
          }
        },
        builder: (context, state) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: AssetImage(AppImageAssets.splash),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
