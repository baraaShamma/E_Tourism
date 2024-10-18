import 'package:e_tourism/features/add_for_admin/add_trip/data/data_sources/admin_trip_remote_data_source.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/data/models/admin_trip_model.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/entities/admin_trip_entities.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/repositories/admin_trip_repository.dart';

class AdminAddTripRepositoryImpl implements AdminAddTripRepository {
  final AdminAddTripRemoteDataSource remoteDataSource;

  AdminAddTripRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<AdminTouristProgram>> getTouristPrograms() async {
    return await remoteDataSource.fetchTouristPrograms();
  }

  @override
  Future<List<AdminBus>> getBuses() async {
    return await remoteDataSource.fetchBuses();
  }

  @override
  Future<List<AdminGuide>> getGuides() async {
    return await remoteDataSource.fetchGuides();
  }

  @override
  Future<void> addTrip(AdminTripEntity tripEntity) async {
    await remoteDataSource.addTrip(
      tripEntity.programId,
      tripEntity.busId,
      tripEntity.guideId,
      tripEntity.price,
      tripEntity.maxCapacity,
      tripEntity.tripDate,
    );
  }
}
