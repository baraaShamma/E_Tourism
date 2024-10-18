import 'package:e_tourism/features/add_for_admin/add_trip/data/models/admin_trip_model.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/entities/admin_trip_entities.dart';

abstract class AdminAddTripRepository {
  Future<List<AdminTouristProgram>> getTouristPrograms();
  Future<List<AdminBus>> getBuses();
  Future<List<AdminGuide>> getGuides();
  Future<void> addTrip(AdminTripEntity tripEntity);
}