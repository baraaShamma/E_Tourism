part of 'admin_ads_bloc.dart';

abstract class AdminAdsState extends Equatable {
  const AdminAdsState();

  @override
  List<Object> get props => [];
}

class AdminAdsInitial extends AdminAdsState {}

class AdminAdsLoading extends AdminAdsState {}

class AdminAdsLoaded extends AdminAdsState {
  final List<AdminAdEntity> ads;

  const AdminAdsLoaded(this.ads);

  @override
  List<Object> get props => [ads];
}

class AdminAdDeleted extends AdminAdsState {}

class AdminAdAdded extends AdminAdsState {}

class AdminAdsError extends AdminAdsState {
  final String message;

  const AdminAdsError(this.message);

  @override
  List<Object> get props => [message];
}