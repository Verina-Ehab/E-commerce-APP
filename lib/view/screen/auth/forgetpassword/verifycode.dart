import 'package:e_commerce/controller/auth/verifycode_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/constant/background.dart';
import 'package:e_commerce/view/widget/auth/otp_verification_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Verification Code'),
      ),
      body: Stack(
        children: [
          const Background(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            child: ListView(
              children: [
                Text(
                  "Check Code",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: GetBuilder<VerifyCodeControllerImp>(
                      builder: ((controller) => HandlingDataRequest(
                            statusRequest: controller.statusRequest,
                            widget: ListView(
                              children: [
                                Text(
                                  "Please enter the digit code sent to ${controller.email}",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const OTP(),
                                InkWell(
                                  onTap: () {
                                    controller.resend();
                                  },
                                  child: const Text("Resend"),
                                )
                              ],
                            ),
                          ))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
