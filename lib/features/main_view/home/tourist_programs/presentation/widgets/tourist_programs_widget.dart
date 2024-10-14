import 'package:e_tourism/Config/navigation/app_route.dart';
import 'package:e_tourism/core/constant/colors.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/entities/tourist_programs_entity.dart';
import 'package:e_tourism/link_api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class TouristProgramsWidget extends StatelessWidget {
  final List<TouristProgramsEntity> touristPrograms;

  const TouristProgramsWidget({
    Key? key,
    required this.touristPrograms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: touristPrograms.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.6),
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () {
              final id = touristPrograms[index].id;
              context.push('${RoutesPaths.touristProgramsDetailScreen}/$id');

            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: AppLink.baseUrlImage +
                              touristPrograms[index].image,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("27".tr() + touristPrograms[index].type,
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(touristPrograms[index].name,
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
