import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_tourism/Config/navigation/app_route.dart';
import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/presentation/bloc/tourist_programs_bloc.dart';
import 'package:e_tourism/link_api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TouristProgramsDetailScreen extends StatelessWidget {
  const TouristProgramsDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourist Program Details'),
      ),
      body: BlocBuilder<TouristProgramsBloc, TouristProgramsState>(
        builder: (context, state) {
          if (state is LoadingTouristProgramsState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TouristProgramLoadedById) {
            final program = state.program;
            return ListView(
              children: [
                Hero(
                  tag: program.id.toString(),
                  child: CachedNetworkImage(
                    imageUrl: AppLink.baseUrlImage + program.image,
                    height: AppSizeH.s250,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("28".tr()),
                    Text(program.name),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("29".tr()),
                    Text(program.type),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Text("30".tr()),
                    const SizedBox(height: 10),
                    Text(program.description),
                    const SizedBox(height: 20),
                    program.hasTrips == 1
                        ? InkWell(
                            onTap: () {
                              context.push(
                                  '${RoutesPaths.tripsScreen}/${program.id}');
                            },
                            child: Text("31".tr()),
                          )
                        : Text("32".tr())
                  ],
                ),
              ],
            );
          } else if (state is ErrorTouristProgramsState) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
