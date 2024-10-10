part of 'ads_bloc.dart';

abstract class AdsState extends Equatable {
  @override
  List<Object> get props => [];
}

class AdsInitial extends AdsState {}

class AdsLoading extends AdsState {}

class AdsLoaded extends AdsState {
  final List<AdEntity> ads;

  AdsLoaded(this.ads);
}

class AdsError extends AdsState {
  final String message;

  AdsError(this.message);
}
