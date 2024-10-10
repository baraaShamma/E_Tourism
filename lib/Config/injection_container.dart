import 'package:e_tourism/Config/navigation/app_router_config.dart';
import 'package:e_tourism/core/network/network_info.dart';
import 'package:e_tourism/core/theme/bloc/theme_bloc.dart';
import 'package:e_tourism/features/main_view/home/ads/domain/use_cases/get_ads_use_case.dart';
import 'package:e_tourism/features/main_view/home/ads/presentation/bloc/ads_bloc.dart';
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

final instance = GetIt.instance;
resetAllModules() async {
  await instance.reset(dispose: false);
  await init();
}

Future<void> init() async {
//! Features - posts
  instance.registerLazySingleton<GoRouter>(() => AppRouterConfig.router);
  instance.registerFactory<AppPreferences>(
          () => AppPreferences(instance()));
// Bloc
  instance.registerLazySingleton(() => ThemeBloc());

  instance.registerFactory(() => LoginBloc(loginUseCase: instance()));
// Ads Services

  instance.registerLazySingleton<AdsRemoteDataSource>(
        () => AdsRemoteDataSourceImpl(client: instance(), appPreferences: instance()),
  );

  instance.registerLazySingleton<AdsRepository>(
        () => AdsRepositoryImpl(remoteDataSource: instance()),
  );

  instance.registerLazySingleton(
        () => GetAdsUseCase(repository: instance()),
  );

  instance.registerFactory(
        () => AdsBloc(getAdsUseCase: instance()),
  );


// Usecases

  instance.registerLazySingleton(() => LoginUseCase(instance()));

// Repository

  instance.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginRemote: instance(), networkInfo: instance()));

// Datasources

  instance.registerLazySingleton<LoginRemote>(
      () => LoginRemoteImpl(client: instance()));

//! Core

  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(instance()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton(() => sharedPreferences);
  instance.registerLazySingleton(() => http.Client());
  instance.registerLazySingleton(() => InternetConnectionChecker());
}
