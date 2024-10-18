
import 'package:equatable/equatable.dart';

class BusEntity extends Equatable {
  final int id;
  final String busType;
  final int seatCount;

  BusEntity({required this.id, required this.busType, required this.seatCount});

  @override
  List<Object> get props => [id, busType, seatCount];
}
