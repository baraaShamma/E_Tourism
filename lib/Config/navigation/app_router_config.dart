import 'package:e_tourism/Config/navigation/app_route.dart';
import 'package:e_tourism/features/auth/signup/presentation/pages/signup_screen.dart';
import 'package:e_tourism/features/main_view/home/ads/presentation/bloc/ads_bloc.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/presentation/bloc/tourist_programs_bloc.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/presentation/pages/tourist_programs_detail_screen.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/presentation/pages/tourist_programs_screen.dart';
import 'package:e_tourism/features/main_view/main_view.dart';
import 'package:e_tourism/features/splash/presentation/pages/splash_page.dart';
import 'package:e_tourism/features/trips/presentation/bloc/trips_bloc.dart';
import 'package:e_tourism/features/trips/presentation/pages/trips_screen.dart';
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
          path: RoutesPaths.singUpScreen,
          name: RoutesNames.singUpScreen,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: RoutesPaths.MainView,
          name: RoutesNames.MainView,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => di.instance<AdsBloc>()..add(FetchAdsEvent())),
              BlocProvider(
                  create: (_) => di.instance<TouristProgramsBloc>()
                    ..add(GetAllTouristProgramsEvent())),
            ],
            child: MainView(),
          ),
        ),
        GoRoute(
          path: RoutesPaths.touristProgramsScreen,
          name: RoutesNames.touristProgramsScreen,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => di.instance<TouristProgramsBloc>()
                    ..add(GetAllTouristProgramsEvent())),
            ],
            child: const TouristProgramsScreen(),
          ),
        ),
        GoRoute(
          path: '${RoutesPaths.touristProgramsDetailScreen}/:id',
          name: RoutesNames.touristProgramsDetailScreen,
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => di.instance<TouristProgramsBloc>()
                    ..add(GetTouristProgramEventById(id)),
                ),
              ],
              child: const TouristProgramsDetailScreen(),
            );
          },
        ),
        GoRoute(
          path: '${RoutesPaths.tripsScreen}/:id',
          name: RoutesNames.tripsScreen,
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return BlocProvider(
              create: (_) =>
                  di.instance<TripsBloc>()..add(GetTripsByProgramIdEvent(id)),
              child: TripsScreen(),
            );
          },
        ),
      ]);
}
