import 'dart:io';

import 'package:e_tourism/features/add_for_admin/trips_admin/domain/repositories/admin_trip_repository.dart';

class UploadTripImageUseCase {
  final AdminTripRepository repository;

  UploadTripImageUseCase(this.repository);

  Future<void>  call(String tripId, File imagePath) async {
    return await repository.uploadTripImage(tripId, imagePath);
  }
}
