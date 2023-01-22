import 'package:e_commerce/controller/auth/forget_password/resetpassword_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/constant/background.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text('Reset Password'),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: ((controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Stack(
                    children: [
                      const Background(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40),
                        child: ListView(
                          children: [
                            Text(
                              "New Password",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Text(
                                "Please complete the form to set a new password",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // CustomTextFormAuth(
                            //     valid: (val) {
                            //       return validInput(val!, 5, 30, "password");
                            //     },
                            //     myController: controller.oldPassword,
                            //     label: "Old Password",
                            //     hint: "Enter your old password"),
                            CustomTextFormAuth(
                                valid: (val) {
                                  return validInput(val!, 5, 30, "password");
                                },
                                myController: controller.newPassword,
                                label: "New Password",
                                hint: "Enter your new password"),
                            CustomTextFormAuth(
                                valid: (val) {
                                  return validInput(val!, 5, 30, "password");
                                },
                                myController: controller.reNewPassword,
                                label: "Re-enter New Password",
                                hint: "Re-enter your new password"),
                            CustomButton(name: "Save", onPressed: () {}),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
