import 'package:e_commerce/controller/auth/success_controller.dart';
import 'package:e_commerce/core/constant/background.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessControllerImp controller = Get.put(SuccessControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Success!'),
      ),
      body: Stack(
        children: [
          const Background(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.check_circle_outline,
                  color: AppColor.primaryColor,
                  size: 200.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Congratulations"),
                const Text("successfully registered"),
                const Spacer(),
                CustomButton(
                    name: "Go To Log In",
                    onPressed: () {
                      controller.goToLogin();
                    }),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
