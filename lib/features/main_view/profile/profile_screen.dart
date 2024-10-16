import 'package:e_tourism/Config/injection_container.dart';
import 'package:e_tourism/Config/navigation/app_route.dart';
import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:e_tourism/core/localization/language_drop_down_form_field.dart';
import 'package:e_tourism/core/localization/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  AppPreferences appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizeW.s22, vertical: AppSizeH.s20),
              child: Row(
                children: [
                  Icon(Icons.person, color: Colors.blue, size: AppSizeH.s25),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("55".tr(),
                      style: TextStyle(
                          color: Colors.black, fontSize: AppSizeSp.s20)),
                ],
              ),
            ),
            onTap: () async {
              await appPreferences.logOutPref();
              context.goNamed(RoutesNames.splash);
            },
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizeW.s22, vertical: AppSizeH.s20),
              child: Row(
                children: [
                  Icon(Icons.language, color: Colors.blue, size: AppSizeH.s25),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text("56".tr(),
                        style: TextStyle(
                            color: Colors.black, fontSize: AppSizeSp.s20)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: AppSizeH.s70,
                      width: AppSizeW.s150,
                      child: LanguageDropDown(
                          label: "0".tr(),
                          items: LanguageType.values,
                          onChanged: (v) async {
                            context.setLocale(await instance<AppPreferences>()
                                .switchAppLanguage(v));
                          }),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () async {
              await appPreferences.logOutPref();
              context.goNamed(RoutesNames.splash);
            },
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizeW.s22, vertical: AppSizeH.s20),
              child: Row(
                children: [
                  Icon(Icons.exit_to_app,
                      color: Colors.blue, size: AppSizeH.s25),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("57".tr(),
                      style: TextStyle(
                          color: Colors.black, fontSize: AppSizeSp.s20)),
                ],
              ),
            ),
            onTap: () async {
              await appPreferences.logOutPref();
              context.goNamed(RoutesNames.splash);
            },
          ),
        ],
      ),
    );
  }
}
