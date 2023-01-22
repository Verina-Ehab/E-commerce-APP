import 'package:e_commerce/core/constant/apptheme.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController{
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme= themeEnglish;

  changeLang(String langCode){
    Locale locale= Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? prefsLang= myServices.sharedPreferences.getString("lang");
    if(prefsLang == "AR"){
      language = const Locale("AR");
      appTheme = themeArabic;
    }
    else if(prefsLang == "EN"){
      language = const Locale("EN");
      appTheme = themeEnglish;
    }
    else{
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeArabic;
    }
    super.onInit();
  }
}