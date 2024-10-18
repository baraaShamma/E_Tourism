import 'package:equatable/equatable.dart';

class AdminAdEntity extends Equatable {
  final int id;
  final String imageUrl;

  const AdminAdEntity({required this.id, required this.imageUrl});

  @override
  List<Object?> get props => [id, imageUrl];
}
