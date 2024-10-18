import 'package:e_tourism/Config/navigation/app_router_config.dart';
import 'package:e_tourism/core/network/network_info.dart';
import 'package:e_tourism/core/theme/bloc/theme_bloc.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/data/data_sources/buss_admin_remote_data_source.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/data/repositories/buss_admin_repository_impl.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/repositories/buss_admin_repository.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/use_cases/add_bus_use_case.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/use_cases/delete_bus_use_case.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/use_cases/get_buss_use_case.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/use_cases/update_bus_use_case.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/presentation/bloc/buss_admin_bloc.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/data/data_sources/guide_admin_remote_data_source.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/data/repositories/guide_admin_repository_impl.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/repositories/guide_admin_repository.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/use_cases/add_bus_use_case.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/use_cases/delete_guide_use_case.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/use_cases/get_guide_use_case.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/presentation/bloc/guides_admin_bloc.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/data/data_sources/tourist_programs_admin_remote_data_source.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/data/repositories/tourist_programs_admin_repository_impl.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/repositories/tourist_programs_admin_repository.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/use_cases/add_tourist_program_use_case.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/use_cases/delete_tourist_program_use_case.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/use_cases/get_tourist_programs_use_case.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/use_cases/update_tourist_program_use_case.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/presentation/bloc/tourist_programs_admin__bloc.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/data/data_sources/admin_trip_remote_data_source.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/data/repositories/admin_trip_repository_impl.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/domain/repositories/admin_trip_repository.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/domain/use_cases/admin_get_trips_use_case.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/domain/use_cases/delete_trip_use_case.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/domain/use_cases/upload_trip_image_use_case.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/presentation/bloc/admin_trips_bloc.dart';
import 'package:e_tourism/features/auth/signup/data/data_sources/signup_remote.dart';
import 'package:e_tourism/features/auth/signup/data/repositories/signup_repository_impl.dart';
import 'package:e_tourism/features/auth/signup/domain/repositories/signup_repository.dart';
import 'package:e_tourism/features/auth/signup/domain/use_cases/signup_use_case.dart';
import 'package:e_tourism/features/auth/signup/presentation/bloc/signUp_bloc.dart';
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
import 'package:e_tourism/features/search/data/data_sources/search_trips_remote_data_source.dart';
import 'package:e_tourism/features/search/data/repositories/search_trips_repository_impl.dart';
import 'package:e_tourism/features/search/domain/repositories/search_trips_repository.dart';
import 'package:e_tourism/features/search/domain/use_cases/register_for_trip_search_use_case.dart';
import 'package:e_tourism/features/search/domain/use_cases/search_trips_by_dates.dart';
import 'package:e_tourism/features/search/domain/use_cases/search_trips_by_name.dart';
import 'package:e_tourism/features/search/presentation/bloc/search_bloc.dart';
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
  instance.registerFactory(() =>SignUpBloc(signUpUseCase: instance()));
  instance.registerFactory(
      () => MyTripsBloc(getRegisteredTripsUseCase: instance()));
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

  //===========search========================
  instance.registerLazySingleton<SearchTripsRemoteDataSource>(() =>
      SearchTripsRemoteDataSource(
          client: instance(), appPreferences: instance()));

  instance.registerLazySingleton<SearchTripsRepository>(
    () => SearchTripsRepositoryImpl(instance()),
  );
  instance.registerLazySingleton(() => SearchTripsByName(instance()));
  instance.registerLazySingleton(() => SearchTripsByDates(instance()));
  instance
      .registerLazySingleton(() => RegisterForTripSearchUseCase(instance()));
  instance.registerFactory(
    () => SearchBloc(
        searchByName: instance(),
        searchByDates: instance(),
        registerForTripUseCase: instance()),
  );

  //====================
// Usecases

  instance.registerLazySingleton(() => LoginUseCase(instance()));
  instance.registerLazySingleton(() => SignUpUseCase(instance()));

  instance.registerLazySingleton(() => GetTouristProgramsUseCases(instance()));
  instance
      .registerLazySingleton(() => GetTouristProgramByIdUseCase(instance()));
  instance.registerLazySingleton(
      () => GetRegisteredTripsUseCase(repository: instance()));

// Repository

  instance.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(remoteDataSource: instance()));
  instance.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(signUpRemote: instance()));
  instance.registerLazySingleton<TouristProgramsRepository>(() =>
      TouristProgramsRepositoryImpl(
          remoteDataSource: instance(), networkInfo: instance()));
  instance.registerLazySingleton<MyTripRepository>(
      () => MyTripRepositoryImpl(remoteDataSource: instance()));
// Datasources

  instance.registerLazySingleton<LoginRemote>(
      () => LoginRemoteImpl(client: instance()));
  instance.registerLazySingleton<SignUpRemote>(
      () => SignUpRemoteImpl(client: instance()));
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

  //admin
  instance.registerLazySingleton<TouristProgramsAdminRemoteDataSource>(
    () => TouristProgramsAdminRemoteDataSource(
        client: instance(), appPreferences: instance()),
  );
  instance.registerLazySingleton<BussAdminRemoteDataSource>(
    () => BussAdminRemoteDataSource(
        client: instance(), appPreferences: instance()),
  );
  instance.registerLazySingleton<GuidesAdminRemoteDataSource>(
    () => GuidesAdminRemoteDataSource(
        client: instance(), appPreferences: instance()),
  );

  // Repositories
  instance.registerLazySingleton<TouristProgramsAdminRepository>(
    () => TouristProgramsAdminRepositoryImpl(instance()),
  );
  instance.registerLazySingleton<BussAdminRepository>(
    () => BussAdminRepositoryImpl(instance()),
  );
  instance.registerLazySingleton<GuidesAdminRepository>(
    () => GuidesAdminRepositoryImpl(instance()),
  );

  // Use Cases
  instance.registerLazySingleton<AddTouristProgramUseCase>(
    () => AddTouristProgramUseCase(instance()),
  );
  instance.registerLazySingleton<DeleteTouristProgramUseCase>(
    () => DeleteTouristProgramUseCase(instance()),
  );
  instance.registerLazySingleton<UpdateTouristProgramUseCase>(
    () => UpdateTouristProgramUseCase(instance()),
  );

  instance.registerLazySingleton<GetTouristProgramsUseCase>(
    () => GetTouristProgramsUseCase(instance()),
  );
  //=======
  instance.registerLazySingleton<AddBusUseCase>(
    () => AddBusUseCase(instance()),
  );
  instance.registerLazySingleton<DeleteBusUseCase>(
    () => DeleteBusUseCase(instance()),
  );
  instance.registerLazySingleton<UpdateBusUseCase>(
    () => UpdateBusUseCase(instance()),
  );
  instance.registerLazySingleton<GetBussUseCase>(
    () => GetBussUseCase(instance()),
  );
//=========================
  instance.registerLazySingleton<AddGuideUseCase>(
    () => AddGuideUseCase(instance()),
  );
  instance.registerLazySingleton<DeleteGuideUseCase>(
    () => DeleteGuideUseCase(instance()),
  );

  instance.registerLazySingleton<GetGuidesUseCase>(
    () => GetGuidesUseCase(instance()),
  );
  // Bloc
  instance.registerFactory<TouristProgramsAdminBloc>(
    () => TouristProgramsAdminBloc(
      addTouristProgramUseCase: instance(),
      deleteTouristProgramUseCase: instance(),
      getTouristProgramsUseCase: instance(),
      updateTouristProgramUseCase: instance(),
    ),
  );

  instance.registerFactory<BussAdminBloc>(
    () => BussAdminBloc(
      addBusUseCase: instance(),
      deleteBusUseCase: instance(),
      getBussUseCase: instance(),
      updateBusUseCase: instance(),
    ),
  );
  instance.registerFactory<GuidesAdminBloc>(
    () => GuidesAdminBloc(
      addGuideUseCase: instance(),
      deleteGuideUseCase: instance(),
      getGuidesUseCase: instance(),
    ),
  );
  instance.registerFactory(() => AdminTripsBloc(
    getTripsUseCase: instance(),
    deleteTripUseCase: instance(),
    uploadTripImageUseCase: instance(),
  ));

  // UseCases
  instance.registerLazySingleton(() => AdminGetTripsUseCase(instance()));
  instance.registerLazySingleton(() => DeleteTripUseCase(instance()));
  instance.registerLazySingleton(() => UploadTripImageUseCase(instance()));

  // Repository
  instance.registerLazySingleton<AdminTripRepository>(() => AdminTripRepositoryImpl(
    remoteDataSource: instance(),
  ));

  // Data sources
  instance.registerLazySingleton<AdminTripRemoteDataSource>(
        () => AdminTripRemoteDataSourceImpl(client: instance(),appPreferences: instance()),
  );

}
