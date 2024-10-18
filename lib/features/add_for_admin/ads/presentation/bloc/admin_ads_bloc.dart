
import 'package:bloc/bloc.dart';
import 'package:e_tourism/features/add_for_admin/ads/domain/entities/admin_ad_entity.dart';
import 'package:e_tourism/features/add_for_admin/ads/domain/use_cases/add_ad_use_case.dart';
import 'package:e_tourism/features/add_for_admin/ads/domain/use_cases/delete_ad_use_case.dart';
import 'package:e_tourism/features/add_for_admin/ads/domain/use_cases/get_ads_use_case.dart';
import 'package:equatable/equatable.dart';

part 'admin_ads_event.dart';
part 'admin_ads_state.dart';

class AdminAdsBloc extends Bloc<AdminAdsEvent, AdminAdsState> {
  final GetAdsAdminUseCase getAdsUseCase;
  final DeleteAdUseCase deleteAdUseCase;
  final AddAdUseCase addAdUseCase;

  AdminAdsBloc({
    required this.getAdsUseCase,
    required this.deleteAdUseCase,
    required this.addAdUseCase,
  }) : super(AdminAdsInitial()) {
    on<LoadAds>((event, emit) async {
      emit(AdminAdsLoading());
      try {
        final ads = await getAdsUseCase();
        emit(AdminAdsLoaded(ads));
      } catch (e) {
        emit(AdminAdsError('Failed to load ads'));
      }
    });

    on<DeleteAd>((event, emit) async {
      emit(AdminAdsLoading());
      try {
        await deleteAdUseCase(event.id);
        emit(AdminAdDeleted());
        add(LoadAds()); // Reload ads
      } catch (e) {
        emit(AdminAdsError('Failed to delete ad'));
      }
    });

    on<AddAd>((event, emit) async {
      emit(AdminAdsLoading());
      try {
        await addAdUseCase(event.imagePath);
        emit(AdminAdAdded());
        add(LoadAds()); // Reload ads
      } catch (e) {
        emit(AdminAdsError('Failed to add ad'));
      }
    });
  }
}