import 'dart:io';

import 'package:e_tourism/features/add_for_admin/trips_admin/data/data_sources/admin_trip_remote_data_source.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/data/models/trip_admin_model.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/domain/entities/admin_trip.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/domain/repositories/admin_trip_repository.dart';

class AdminTripRepositoryImpl implements AdminTripRepository {
  final AdminTripRemoteDataSource remoteDataSource;

  AdminTripRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Trip>> getTrips() async {
    try {
      // Fetch trips from the remote data source (API)
      final List<TripModel> tripModels = await remoteDataSource.getTrips();
      // Convert models to entities and return
      return tripModels.map((tripModel) => tripModel.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to fetch trips: $e');
    }
  }

  @override
  Future<void> deleteTrip(int id) async {
    try {
      await remoteDataSource.deleteTrip(id);
    } catch (e) {
      throw Exception('Failed to delete trip: $e');
    }
  }

  @override
  Future<void> uploadTripImage(String tripId, File image) async {
    try {
      await remoteDataSource.uploadTripImage(tripId, image);
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }
}
