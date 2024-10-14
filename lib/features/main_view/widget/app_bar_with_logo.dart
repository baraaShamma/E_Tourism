import 'package:e_tourism/core/constant/colors.dart';
import 'package:e_tourism/core/constant/image_assets.dart';
import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarAppLogo extends AppBar {
  final void Function()? onPressedIcon;
  AppbarAppLogo({
    Key? key,
    this.onPressedIcon,
    Widget? leading,
    Widget? title,
    Color? backgroundColor,
    bool showBackButton = false,
    List<Widget>? actions,
    double? elevation,
    double? leadingWidth,

  }) : super(
          key: key,
          leading: Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppSizeW.s18,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap:onPressedIcon,
                    child: Icon(Icons.logout, color: AppColor.black)),
              ],
            ),
          ),
          title: title,
          automaticallyImplyLeading: false,
          leadingWidth: leadingWidth ?? AppSizeW.s70,
          centerTitle: true,
          backgroundColor: backgroundColor,
          elevation: elevation,
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
