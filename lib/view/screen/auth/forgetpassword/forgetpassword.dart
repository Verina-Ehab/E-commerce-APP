import 'package:e_commerce/controller/auth/forget_password/forgetpassword_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/constant/background.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Forget Password'),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(builder: ((controller) => HandlingDataRequest(statusRequest: controller.statusRequest, widget: Stack(
        children: [
          const Background(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            child: ListView(
              children: [
                Text(
                  "Check Email",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Please enter your email address to recieve a varificatin code",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                CustomTextFormAuth(
                  type: TextInputType.emailAddress,
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                    myController: controller.email,
                    label: "Email",
                    hint: "Enter your last email"),

                CustomButton(
                    name: "Check",
                    onPressed: () {
                      controller.goToVerifyCode();
                    }),
                const SizedBox(
                  height: 30,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text("Have an account?"),
                //     CustomInkWell(text: "Continue", onPressed: (){
                //       controller.goToVerifyCode();
                // },)
                // ],
                // )
              ],
            ),
          ),
        ],
      ),)))
    );
  }
}
