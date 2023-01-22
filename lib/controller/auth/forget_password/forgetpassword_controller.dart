import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:e_commerce/core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  StatusRequest statusRequest= StatusRequest.non;

  
  // SignUpControllerImp({
  //   required this.email,
  //   required this.password,
  //   required this.name,
  //   required this.phone,
  // });

  @override
  void onInit() {
    email= TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
  
  @override
  goToVerifyCode() {
    Get.offNamed(AppRoute.verifyCode);
  }

  @override
  checkEmail() {
    
  }

}
