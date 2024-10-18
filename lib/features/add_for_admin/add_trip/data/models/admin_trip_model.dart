// admin_trip_model.dart

import 'package:e_tourism/features/add_for_admin/add_trip/domain/entities/admin_bus_entity.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/entities/admin_guide_entity.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/entities/admin_tourist_program_entity.dart';
import 'package:equatable/equatable.dart';

class AdminTouristProgram extends Equatable {
  final int id;
  final String type;
  final String name;

  AdminTouristProgram(
      {required this.id, required this.type, required this.name});

  TouristProgramEntity toEntity() {
    return TouristProgramEntity(id: id, name: name, type: type);
  }

  factory AdminTouristProgram.fromJson(Map<String, dynamic> json) {
    return AdminTouristProgram(
      id: json['id'],
      type: json['type'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [id, type, name];
}

class AdminBus extends Equatable {
  final int id;
  final String busType;
  final int seatCount;

  AdminBus({required this.id, required this.busType, required this.seatCount});

  BusEntity toEntity() {
    return BusEntity(id: id, busType: busType, seatCount: seatCount);
  }

  factory AdminBus.fromJson(Map<String, dynamic> json) {
    return AdminBus(
      id: json['id'],
      busType: json['bus_type'],
      seatCount: json['seat_count'],
    );
  }

  @override
  List<Object?> get props => [id, busType, seatCount];
}

class AdminGuide extends Equatable {
  final int id;
  final String fName;
  final String lName;

  AdminGuide({required this.id, required this.fName, required this.lName});

  GuideEntity toEntity() {
    return GuideEntity(id: id, firstName: fName, lastName: lName);
  }

  factory AdminGuide.fromJson(Map<String, dynamic> json) {
    return AdminGuide(
      id: json['id'],
      fName: json['fName'],
      lName: json['lName'],
    );
  }

  @override
  List<Object?> get props => [id, fName, lName];
}
