import 'package:e_tourism/Config/injection_container.dart';
import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/core/localization/language_drop_down_form_field.dart';
import 'package:e_tourism/core/localization/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
       Center(
            child: LanguageDropDown(
                label: "0".tr(),
                items: LanguageType.values,
                onChanged: (v) async {
                  context.setLocale(
                      await instance<AppPreferences>().switchAppLanguage(v));
                }),
          ),

        ],
      ),
    );
  }
}
