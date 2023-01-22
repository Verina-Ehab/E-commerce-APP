import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/data/data_source/remote/auth/verifycode_data.dart';
import 'package:get/get.dart';

import 'package:e_commerce/core/constant/routes.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verificationCode);
  goToSuccessSign(String verificationCode);
  resend();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  // late TextEditingController code;
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  // late String code;
  String? email;
  // late String verifycode;
  StatusRequest statusRequest= StatusRequest.non ;

  @override
  void onInit() {
    // code= TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  // @override
  // void dispose() {
  //   // code.dispose();
  //   super.dispose();
  // }

  @override
  goToResetPassword(verificationCode) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postdata(email!, verificationCode);
    // print("========================== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(title: "Warning!", middleText: "Verifycode isn't correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToSuccessSign(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postdata(email!, verificationCode);
    // print("========================== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(title: "Warning!", middleText: "Invalid Verifycode");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    Get.offNamed(AppRoute.successSignUp);
  }

  @override
  checkCode() {}
  
  @override
  resend() {
    verifyCodeData.resendData(email!);
  }
}
