
import 'package:equatable/equatable.dart';

class GuideEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;

  GuideEntity({required this.id, required this.firstName, required this.lastName});

  @override
  List<Object> get props => [id, firstName, lastName];
}
