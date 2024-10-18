

import 'package:e_tourism/features/add_for_admin/add_trip/data/models/admin_trip_model.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/repositories/admin_trip_repository.dart';

class GetAdminGuidesUseCase {
  final AdminAddTripRepository repository;

  GetAdminGuidesUseCase(this.repository);

  Future<List<AdminGuide>> execute() async {
    return await repository.getGuides();
  }
}
