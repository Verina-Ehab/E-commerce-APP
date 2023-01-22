import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();

  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.non;
  // bool isShowPass = true;
  bool visablePass = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  goToSignUp() {
    // "off" not "to" why?
    // cause when this page opened at the first time
    // a global key will be initialized
    // and if you go to sign up, after registeration you will re-forward to log in
    // in this case a global key will initialized a second time
    // so you will have an error "Dublicated GlobalKey detected in widget tree"
    Get.offNamed(AppRoute.signUp);
  }

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(password.text, email.text);
      // print("========================== Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == "1") {
            // data.addAll(response['data']);
            myServices.sharedPreferences
                .setString("id", response['data']['users_id']);
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");

            Get.offNamed(AppRoute.home);
          } else {
            Get.toNamed(AppRoute.verifyCode, arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Warning!", middleText: "Email or phone already exist");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      // print(value);
      // String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  showPassword() {
    visablePass = !visablePass;
    update();
  }
}
