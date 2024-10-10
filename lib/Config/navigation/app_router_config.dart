import 'package:e_tourism/Config/navigation/app_route.dart';
import 'package:e_tourism/features/auth/signup/presentation/pages/signup_screen.dart';
import 'package:e_tourism/features/main_view/home/ads/presentation/bloc/ads_bloc.dart';
import 'package:e_tourism/features/main_view/main_view.dart';
import 'package:e_tourism/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_tourism/features/auth/login/presentation/screen/login_screen.dart';
import 'package:e_tourism/Config/injection_container.dart' as di;

class AppRouterConfig {
  static final router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: RoutesPaths.splash,
      routes: [
        GoRoute(
          path: RoutesPaths.splash,
          name: RoutesNames.splash,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: RoutesPaths.loginScreen,
          name: RoutesNames.loginScreen,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: RoutesPaths.MainView,
          name: RoutesNames.MainView,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => di.instance<AdsBloc>()..add(FetchAdsEvent())),

            ],
            child:  MainView(),
          ),
          // builder: (context, state) => MainView(),
        ),
        GoRoute(
          path: RoutesPaths.singUpScreen,
          name: RoutesNames.singUpScreen,
          builder: (context, state) => const SignUpScreen(),
        ),
      ]);
}
