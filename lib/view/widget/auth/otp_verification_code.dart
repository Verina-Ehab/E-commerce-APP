import 'package:e_commerce/controller/auth/verifycode_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OTP extends StatelessWidget {
  const OTP({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return OtpTextField(
                  numberOfFields: 5,
                  borderRadius: BorderRadius.circular(20),
                  borderColor: AppColor.primaryColor,
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                            actions: [
                              CustomButton(
                                name: "OK",
                                onPressed: () {
                                  controller.goToSuccessSign(verificationCode);
                                },
                              )
                            ],
                          );
                        });
                  }, // end onSubmit
                );
  }
}