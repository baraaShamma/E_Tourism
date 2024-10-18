
import 'package:bloc/bloc.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/entities/buss_entity.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/use_cases/add_bus_use_case.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/use_cases/delete_bus_use_case.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/use_cases/get_buss_use_case.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/use_cases/update_bus_use_case.dart';

part 'buss_admin_event.dart';
part 'buss_admin_state.dart';

class BussAdminBloc extends Bloc<BussAdminEvent, BussAdminState> {
  final GetBussUseCase getBussUseCase;
  final AddBusUseCase addBusUseCase;
  final UpdateBusUseCase updateBusUseCase;
  final DeleteBusUseCase deleteBusUseCase;

  BussAdminBloc({
    required this.getBussUseCase,
    required this.addBusUseCase,
    required this.updateBusUseCase,
    required this.deleteBusUseCase,
  }) : super( BussInitial()) {
    on<LoadBuss>((event, emit) async {
      emit(BussLoading());
      try {
        final buss = await getBussUseCase();
        emit(BussLoaded(buss));
      } catch (e) {
        emit(BussError(e.toString()));
      }
    });

    on<AddBus>((event, emit) async {
      emit(BussLoading());
      try {
        print(event.busNumber);
        print(event.busType);
        print( event.seatCount);
        print("000000000000044444444444400000000");
        await addBusUseCase(event.busNumber, event.busType, event.seatCount);
        final programs = await getBussUseCase();
        emit(BussLoaded(programs));
      } catch (e) {
        emit(BussError(e.toString()));
      }
    });

    on<UpdateBus>((event, emit) async {
      emit(BussLoading());
      try {
        await updateBusUseCase(event.id, event.busStatus);
        final programs = await getBussUseCase();
        emit(BussLoaded(programs));
      } catch (e) {
        emit(BussError(e.toString()));
      }
    });

    on<DeleteBus>((event, emit) async {
      emit(BussLoading());
      try {
        await deleteBusUseCase(event.id);
        final programs = await getBussUseCase();
        emit(BussLoaded(programs));
      } catch (e) {
        emit(BussError(e.toString()));
      }
    });
  }
}