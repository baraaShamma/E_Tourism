
import 'package:e_tourism/core/constant/image_assets.dart';
import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:flutter/material.dart';

class LogoAuthWidget extends StatelessWidget {
  const LogoAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: AppSizeR.s100,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: ClipOval(
            child: Image.asset(
              AppImageAssets.logo,
            ),
          ),
        ));
  }
}