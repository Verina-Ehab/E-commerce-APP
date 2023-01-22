import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/logo.dart';
import 'package:e_commerce/view/widget/mybutton.dart';
import 'package:e_commerce/view/widget/onboarding/customslider.dart';
import 'package:e_commerce/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: size.height * 0.15,
          ),
          const Logo(),
          const SizedBox(
            height: 80,
          ),
          const Expanded(
            flex: 1,
            child: CustomSliderOnBoarding(),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  const CustomDotControllerOnBoarding(),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                      name: 'Continue',
                      onPressed: () {
                        controller.next();
                      }),
                ],
              ))
        ],
      )),
    );
  }
}
