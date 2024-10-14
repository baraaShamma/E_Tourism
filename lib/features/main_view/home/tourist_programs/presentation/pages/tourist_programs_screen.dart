import 'package:e_tourism/core/widgets/app_bar_widget.dart';
import 'package:e_tourism/core/widgets/button-widget.dart';
import 'package:e_tourism/core/widgets/loading_widget.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/presentation/bloc/tourist_programs_bloc.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/presentation/widgets/tourist_programs_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TouristProgramsScreen extends StatelessWidget {
  const TouristProgramsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text(
          "25".tr(),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocBuilder<TouristProgramsBloc, TouristProgramsState>(
        builder: (context, state) {
          if (state is LoadingTouristProgramsState) {
            return const LoadingWidget();
          } else if (state is LoadedTouristProgramsState) {
            return TouristProgramsWidget(
                touristPrograms: state.touristProgramsEntity);
          } else if (state is ErrorTouristProgramsState) {
            return Center(
                child: ButtonWidget(
              text: "24".tr(),
              onPressed: () {
                context
                    .read<TouristProgramsBloc>()
                    .add(GetAllTouristProgramsEvent());
              },
            ));
          }
          return const Center(child: Text('No TouristPrograms'));
        },
      ),
    );
  }
}
