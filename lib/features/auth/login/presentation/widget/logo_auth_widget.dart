
import 'package:e_tourism/core/constant/image_assets.dart';
import 'package:flutter/material.dart';

class LogoAuthWidget extends StatelessWidget {
  const LogoAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 80,
        backgroundColor: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(0), // Border radius
          child: ClipOval(
            child: Image.asset(
              AppImageAssets.logo,
            ),
          ),
        ));
  }
}