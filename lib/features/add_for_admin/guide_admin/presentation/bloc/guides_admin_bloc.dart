import 'package:bloc/bloc.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/entities/guide_entity.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/use_cases/add_bus_use_case.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/use_cases/delete_guide_use_case.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/use_cases/get_guide_use_case.dart';

part 'guides_admin_event.dart';

part 'guides_admin_state.dart';

class GuidesAdminBloc extends Bloc<GuidesAdminEvent, GuidesAdminState> {
  final GetGuidesUseCase getGuidesUseCase;
  final AddGuideUseCase addGuideUseCase;
  final DeleteGuideUseCase deleteGuideUseCase;

  GuidesAdminBloc({
    required this.getGuidesUseCase,
    required this.addGuideUseCase,
    required this.deleteGuideUseCase,
  }) : super(GuidesInitial()) {
    on<LoadGuides>((event, emit) async {
      emit(GuidesLoading());
      try {
        final guides = await getGuidesUseCase();
        emit(GuidesLoaded(guides));
      } catch (e) {
        emit(GuidesError(e.toString()));
      }
    });

    on<AddGuides>((event, emit) async {
      emit(GuidesLoading());
      try {
        await addGuideUseCase(
            event.fName,
            event.lName,
            event.email,
            event.password,
            event.passwordConfirmation,
            event.address,
            event.mobil);
        final guides = await getGuidesUseCase();
        emit(GuidesLoaded(guides));
      } catch (e) {
        emit(GuidesError(e.toString()));
      }
    });

    on<DeleteGuide>((event, emit) async {
      emit(GuidesLoading());
      try {
        await deleteGuideUseCase(event.id);
        final guides = await getGuidesUseCase();
        emit(GuidesLoaded(guides));
      } catch (e) {
        emit(GuidesError(e.toString()));
      }
    });
  }
}
