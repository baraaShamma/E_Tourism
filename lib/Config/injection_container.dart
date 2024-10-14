import 'package:e_tourism/Config/navigation/app_router_config.dart';
import 'package:e_tourism/core/network/network_info.dart';
import 'package:e_tourism/core/theme/bloc/theme_bloc.dart';
import 'package:e_tourism/features/main_view/home/ads/domain/use_cases/get_ads_use_case.dart';
import 'package:e_tourism/features/main_view/home/ads/presentation/bloc/ads_bloc.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/data/data_sources/tourist_programs_remote_data_source.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/data/repositories/tourist_programs_repository_impl.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/repositories/tourist_programs_repository.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/use_cases/get_tourist_program_id_use_case.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/use_cases/get_tourist_programs_use_cases.dart';
import 'package:e_tourism/features/main_view/my_trips/data/data_sources/my_trip_remote_data_source.dart';
import 'package:e_tourism/features/main_view/my_trips/data/repositories/my_trip_repository_impl.dart';
import 'package:e_tourism/features/main_view/my_trips/domain/repositories/my_trip_repository.dart';
import 'package:e_tourism/features/main_view/my_trips/domain/use_cases/get_registered_trips_use_case.dart';
import 'package:e_tourism/features/main_view/my_trips/presentation/bloc/my_trips_bloc.dart';
import 'package:e_tourism/features/trips/data/data_sources/trips_remote_data_source.dart';
import 'package:e_tourism/features/trips/data/repositories/trips_repository_impl.dart';
import 'package:e_tourism/features/trips/domain/repositories/trips_repository.dart';
import 'package:e_tourism/features/trips/domain/use_cases/get_trips_by_program_id_use_case.dart';
import 'package:e_tourism/features/trips/domain/use_cases/register_for_trip_use_case.dart';
import 'package:e_tourism/features/trips/presentation/bloc/trips_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_tourism/features/auth/login/data/datasources/login_remote.dart';
import 'package:e_tourism/features/auth/login/data/repositories/login_repository_impl.dart';
import 'package:e_tourism/features/auth/login/domain/repositories/login_repository.dart';
import 'package:e_tourism/features/auth/login/domain/usecases/login_use_case.dart';
import 'package:e_tourism/features/auth/login/presentation/bloc/login/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/app_preferences.dart';
import '../features/main_view/home/ads/data/data_sources/ads_remote_data_source.dart';
import '../features/main_view/home/ads/data/repositories/ads_repository_impl.dart';
import '../features/main_view/home/ads/domain/repositories/ads_repository.dart';
import '../features/main_view/home/tourist_programs/presentation/bloc/tourist_programs_bloc.dart';

final instance = GetIt.instance;

resetAllModules() async {
  await instance.reset(dispose: false);
  await init();
}

Future<void> init() async {
//! Features
  instance.registerLazySingleton<GoRouter>(() => AppRouterConfig.router);
  instance.registerFactory<AppPreferences>(() => AppPreferences(instance()));
// Bloc
  instance.registerLazySingleton(() => ThemeBloc());
  instance.registerFactory(() => TouristProgramsBloc(
      getTouristProgramsUseCases: instance(),
      getTouristProgramByIdUseCase: instance()));

  instance.registerFactory(() => LoginBloc(loginUseCase: instance()));
  instance.registerFactory(() => MyTripsBloc(getRegisteredTripsUseCase: instance()));
  instance.registerFactory(() => AdsBloc(getAdsUseCase: instance()));

// DataSources

  instance.registerLazySingleton<AdsRemoteDataSource>(
    () =>
        AdsRemoteDataSourceImpl(client: instance(), appPreferences: instance()),
  );

  instance.registerLazySingleton<AdsRepository>(
    () => AdsRepositoryImpl(remoteDataSource: instance()),
  );

  instance.registerLazySingleton(
    () => GetAdsUseCase(repository: instance()),
  );
  instance.registerLazySingleton<MyTripRemoteDataSource>(() =>
      MyTripRemoteDataSourceImpl(
          client: instance(), appPreferences: instance()));
// Usecases

  instance.registerLazySingleton(() => LoginUseCase(instance()));

  instance.registerLazySingleton(() => GetTouristProgramsUseCases(instance()));
  instance
      .registerLazySingleton(() => GetTouristProgramByIdUseCase(instance()));
  instance.registerLazySingleton(() => GetRegisteredTripsUseCase(repository: instance()));

// Repository

  instance.registerLazySingleton<LoginRepository>(() =>
      LoginRepositoryImpl(loginRemote: instance(), networkInfo: instance()));
  instance.registerLazySingleton<TouristProgramsRepository>(() =>
      TouristProgramsRepositoryImpl(
          remoteDataSource: instance(), networkInfo: instance()));
  instance.registerLazySingleton<MyTripRepository>(
      () => MyTripRepositoryImpl(remoteDataSource: instance()));
// Datasources

  instance.registerLazySingleton<LoginRemote>(
      () => LoginRemoteImpl(client: instance()));
  instance.registerLazySingleton<TouristProgramsRemoteDataSource>(() =>
      TouristProgramsRemoteDataSourceImpl(
          client: instance(), appPreferences: instance()));
//! Core

  instance
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(instance()));
  // Bloc
  instance.registerFactory(() => TripsBloc(
      getTripsByProgramIdUseCase: instance(),
      registerForTripUseCase: instance()));

  // Use Cases
  instance.registerLazySingleton(() => GetTripsByProgramIdUseCase(instance()));
  instance.registerLazySingleton<RegisterForTripUseCase>(
    () => RegisterForTripUseCase(instance()),
  );
  // Repository
  instance.registerLazySingleton<TripsRepository>(
      () => TripsRepositoryImpl(remoteDataSource: instance()));

  // Data Sources
  instance.registerLazySingleton(() =>
      TripsRemoteDataSource(client: instance(), appPreferences: instance()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton(() => sharedPreferences);
  instance.registerLazySingleton(() => http.Client());
  instance.registerLazySingleton(() => InternetConnectionChecker());
}
