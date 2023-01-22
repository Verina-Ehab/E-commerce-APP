import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/data/data_source/remote/auth/sign_up_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:e_commerce/core/constant/routes.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool visiblePass = false;

  StatusRequest statusRequest= StatusRequest.non;
  SignUpData signUpData = SignUpData(Get.find());
  List data =[];

  showPassword() {
    visiblePass = !visiblePass;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(username.text, password.text, email.text, phone.text);
      // print("========================== Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCode, arguments: {"email": email.text,});
        } else {
          Get.defaultDialog(title: "Warning!", middleText: "Phone number or email already exist");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }
}
