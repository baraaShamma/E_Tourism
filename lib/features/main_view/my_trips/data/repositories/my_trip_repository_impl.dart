

import 'package:e_tourism/features/main_view/my_trips/data/data_sources/my_trip_remote_data_source.dart';
import 'package:e_tourism/features/main_view/my_trips/domain/entities/my_trip.dart';
import 'package:e_tourism/features/main_view/my_trips/domain/repositories/my_trip_repository.dart';

class MyTripRepositoryImpl implements MyTripRepository {
  final MyTripRemoteDataSource remoteDataSource;

  MyTripRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<MyTrip>> getRegisteredTrips() async {
    return await remoteDataSource.getRegisteredTrips();
  }
}
