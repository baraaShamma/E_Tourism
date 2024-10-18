part of 'admin_ads_bloc.dart';

abstract class AdminAdsEvent extends Equatable {
  const AdminAdsEvent();

  @override
  List<Object> get props => [];
}

class LoadAds extends AdminAdsEvent {}

class DeleteAd extends AdminAdsEvent {
  final int id;

  const DeleteAd(this.id);

  @override
  List<Object> get props => [id];
}

class AddAd extends AdminAdsEvent {
  final String imagePath;

  const AddAd(this.imagePath);

  @override
  List<Object> get props => [imagePath];
}