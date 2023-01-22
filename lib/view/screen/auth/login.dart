import 'package:e_commerce/controller/auth/login_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/constant/background.dart';
import 'package:e_commerce/core/functions/alert_exit.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/mybutton.dart';
import 'package:e_commerce/view/widget/myinkwell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Sign In'),
      ),
      body: WillPopScope(
          onWillPop: alertExit,
          child: GetBuilder<LoginControllerImp>(
            builder: ((controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Stack(
                  children: [
                    const Background(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
                      child: Form(
                        key: controller.formState,
                        child: ListView(
                          children: [
                            Text(
                              "2".tr,
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
                                "3".tr,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            const SizedBox(
                              height: 55,
                            ),
                            CustomTextFormAuth(
                                // suffix: Icons.email_outlined,
                                type: TextInputType.emailAddress,
                                valid: (val) {
                                  return validInput(val!, 5, 100, "email");
                                },
                                myController: controller.email,
                                label: "Email",
                                hint: "Enter your email"),
                            GetBuilder<LoginControllerImp>(
                                builder: (controller) => CustomTextFormAuth(
                                    suffix: controller.visablePass
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    ontap: () {
                                      controller.showPassword();
                                    },
                                    obsecure: controller.visablePass,
                                    valid: (val) {
                                      return validInput(
                                          val!, 5, 30, "password");
                                    },
                                    myController: controller.password,
                                    label: "Password",
                                    hint: "Enter your password")),
                            CustomInkWell(
                                text: "FORGET PASSWORD?",
                                align: TextAlign.end,
                                onPressed: () {
                                  controller.goToForgetPassword();
                                }),
                            CustomButton(
                                name: "Sign In",
                                onPressed: () {
                                  controller.login();
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have account? "),
                                CustomInkWell(
                                  text: " SIGN UP",
                                  onPressed: () {
                                    controller.goToSignUp();
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ))),
          )),
    );
  }
}
