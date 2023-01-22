import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/data/data_source/remote/auth/forget_password/reset_password_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController{
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  // late TextEditingController oldPassword;
  late TextEditingController newPassword;
  late TextEditingController reNewPassword;
  String? email;

  ResetPasswordData resetPasswordData= ResetPasswordData(Get.find());
  StatusRequest statusRequest= StatusRequest.non;

  @override
  void onInit() {
    email= Get.arguments['email'];
    // oldPassword= TextEditingController();
    newPassword= TextEditingController();
    reNewPassword= TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // oldPassword.dispose();
    newPassword.dispose();
    reNewPassword.dispose();
    super.dispose();
  }

  @override
  resetPassword() {
    // Get.toNamed(AppRoute.signUp);
  }


  @override
  goToSuccessResetPassword() async{
    if(newPassword.text != reNewPassword.text){
      return Get.defaultDialog(title: "Warning!", middleText: "Password not match.");
    }
    if(formstate.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(newPassword.text, email!);
      // print("========================== Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.successResetPassword, arguments: {"email": email});
        } else {
          Get.defaultDialog(title: "Warning!", middleText: "Try Again");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }else{
      // print("Not Valid");
    }
  }
}