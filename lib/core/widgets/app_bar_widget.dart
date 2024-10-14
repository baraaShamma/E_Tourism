import 'package:e_tourism/core/constant/colors.dart';
import 'package:e_tourism/core/constant/image_assets.dart';
import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends AppBar {
  final void Function()? onPressedIcon;
  AppbarWidget({
    Key? key,
    this.onPressedIcon,
    Widget? title,

    Color? backgroundColor,
  }) : super(
          key: key,

          title: title,
          centerTitle: true,
          backgroundColor: backgroundColor,
          elevation: 2,
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                end: AppSizeW.s24,
              ),
              child: Image.asset(
                AppImageAssets.logo,
                width: AppSizeW.s50,
                height: AppSizeH.s62,
              ),
            ),
          ],
        );
}
