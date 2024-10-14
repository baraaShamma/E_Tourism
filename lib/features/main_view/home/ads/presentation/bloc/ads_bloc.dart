import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_tourism/features/main_view/home/ads/domain/entities/ad_entity.dart';
import 'package:e_tourism/features/main_view/home/ads/domain/use_cases/get_ads_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'ads_event.dart';
part 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final GetAdsUseCase getAdsUseCase;

  AdsBloc({required this.getAdsUseCase}) : super(AdsInitial()) {
    on<FetchAdsEvent>((event, emit) async {
      emit(AdsLoading());
      try {
        final ads = await getAdsUseCase.call();
        emit(AdsLoaded(ads));
      } catch (e) {
        emit(AdsError(e.toString()));
      }
    });
  }
}
