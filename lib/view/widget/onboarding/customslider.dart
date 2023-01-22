import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
// import 'package:e_commerce/core/constant/imageasset.dart';
import 'package:e_commerce/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: ((value) => controller.onPageChanged(value)),
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(
                  onBoardingList[i].title!,
                  style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // height: 2,
                        letterSpacing: 1,
                        color: AppColor.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                )
              ],
            ));
  }
}
