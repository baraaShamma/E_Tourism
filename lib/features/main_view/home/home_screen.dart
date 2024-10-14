import 'package:e_tourism/Config/navigation/app_route.dart';
import 'package:e_tourism/core/widgets/button-widget.dart';
import 'package:e_tourism/features/main_view/home/ads/presentation/pages/Ads.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'tourist_programs/presentation/pages/tourist_programs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const Ads(),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("25".tr()),
              ButtonWidget(
                text: "26".tr(),
                onPressed: () {
                  context.pushNamed(RoutesNames.touristProgramsScreen);
                },
              )
            ],
          ),
        ),
        const TouristPrograms()
      ],
    ));
  }
}
