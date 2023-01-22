import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    //wrote "home"/"2" at the first because it has a periorety than 'login'
    // == if the user loged in then go to home page
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.home );
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
    // if (myServices.sharedPreferences.getBool("seenOnBoarding") == true) {
    //   return const RouteSettings(name: AppRoute.login);
    // }
    return null;
  }
}
