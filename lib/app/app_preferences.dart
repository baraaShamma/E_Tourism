import 'dart:ui';

import 'package:e_tourism/Config/injection_container.dart';
import 'package:e_tourism/core/localization/language_manager.dart';
import 'package:e_tourism/core/strings/value_sharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppPreferences {
  final SharedPreferences _sharedPreferences;


  AppPreferences(this._sharedPreferences);
  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString("LOCAL");
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return '';
    }
  }
  Future<Locale?> getLocal() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    }
    if (currentLanguage == LanguageType.ENGLISH.getValue()) {
      return ENGLISH_LOCAL;
    } else {
      return null;
    }
  }
  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  String getUserToken() {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? '';
  }

  Future<Locale> switchAppLanguage(LanguageType languageType) async {
    Locale? currentLanguage = await getLocal();
    if (currentLanguage != languageType.getLocal()) {
      if (languageType == LanguageType.ARABIC) {
        await _sharedPreferences.setString(
            "LOCAL", LanguageType.ARABIC.getValue());
        await resetAllModules();
        return ARABIC_LOCAL;
      } else {
        await _sharedPreferences.setString(
            "LOCAL", LanguageType.ENGLISH.getValue());
        await resetAllModules();
        return ENGLISH_LOCAL;
      }
    } else {
      return languageType.getLocal();
    }
  }
  Future<void> logOutPref() async {
    await _sharedPreferences.setString(PREFS_KEY_TOKEN, '');
    await _sharedPreferences.setBool(PREFS_KEY_USER_LOGGED_IN, false);
  }
  Future<bool> getUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_USER_LOGGED_IN) ?? false;
  }
  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_USER_LOGGED_IN, true);
  }

}
