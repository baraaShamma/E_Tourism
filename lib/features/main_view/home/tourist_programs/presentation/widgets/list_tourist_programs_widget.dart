import 'package:e_tourism/Config/navigation/app_route.dart';
import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:e_tourism/features/main_view/home/tourist_programs/domain/entities/tourist_programs_entity.dart';
import 'package:e_tourism/link_api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListTouristProgramsWidget extends StatelessWidget {
  final List<TouristProgramsEntity> touristPrograms;

  const ListTouristProgramsWidget({
    Key? key,
    required this.touristPrograms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeH.s290,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
              width: AppSizeW.s226,
              child: Card(
                elevation: 0.4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSizeR.s18),
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppSizeR.s12),
                  onTap: () {
                    final id = touristPrograms[index].id;
                    context.push('${RoutesPaths.touristProgramsDetailScreen}/$id');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(AppSizeH.s10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppSizeR.s12),
                          child: Image.network(
                            AppLink.baseUrlImage + touristPrograms[index].image,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                            height: AppSizeH.s180,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              touristPrograms[index].name,
                              style: TextStyle(
                                fontSize: AppSizeSp.s22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.merge_type,
                              color: Theme.of(context).primaryColor,
                              size: AppSizeH.s20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              touristPrograms[index].type,
                              style: TextStyle(
                                fontSize: AppSizeSp.s18,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(right: 10),
              ),
          itemCount: touristPrograms.length ),
    );
  }
}
