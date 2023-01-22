import 'package:e_commerce/controller/auth/signup_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/constant/background.dart';
import 'package:e_commerce/core/functions/alert_exit.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/mybutton.dart';
import 'package:e_commerce/view/widget/myinkwell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text('Sign Up'),
        ),
        body: WillPopScope(
          onWillPop: alertExit,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => 
            HandlingDataRequest(statusRequest: controller.statusRequest, widget: Stack(
              children: [
                const Background(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        Text(
                          "Complete Profile",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            "Complete your profile or continue with social media",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormAuth(
                            valid: (val) {
                              return validInput(val!, 5, 100, "username  ");
                            },
                            myController: controller.username,
                            label: "Name",
                            hint: "Enter your name"),
                        CustomTextFormAuth(
                            type: TextInputType.emailAddress,
                            valid: (val) {
                              return validInput(val!, 5, 100, "email");
                            },
                            myController: controller.email,
                            label: "Email",
                            hint: "Enter youremail"),
                        CustomTextFormAuth(
                            type: TextInputType.number,
                            valid: (val) {
                              return validInput(val!, 12, 12, "phone");
                            },
                            myController: controller.phone,
                            label: "Phone Number",
                            hint: "Enter your phone number"),
                        GetBuilder<SignUpControllerImp>(
                            builder: (controller) => CustomTextFormAuth(
                                suffix: controller.visiblePass
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                ontap: () {
                                  controller.showPassword();
                                },
                                obsecure: controller.visiblePass,
                                valid: (val) {
                                  return validInput(val!, 5, 30, "password");
                                },
                                myController: controller.password,
                                label: "Password",
                                hint: "Enter your password")),
                        CustomButton(
                            name: "Sign UP",
                            onPressed: () {
                              controller.signUp();
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Have an account?"),
                            CustomInkWell(
                              text: "SIGN UP",
                              onPressed: () {
                                controller.goToLogin();
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),)
          ),
        ));
  }
}
