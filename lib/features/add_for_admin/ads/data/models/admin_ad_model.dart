import 'package:e_tourism/features/add_for_admin/ads/domain/entities/admin_ad_entity.dart';

class AdminAdModel extends AdminAdEntity {
  final int id;
  final String imageUrl;

  const AdminAdModel({required this.id, required this.imageUrl})
      : super(id: id, imageUrl: imageUrl);

  factory AdminAdModel.fromJson(Map<String, dynamic> json) {
    return AdminAdModel(
      id: json['id'],
      imageUrl: json['image_url'],
    );
  }


}
