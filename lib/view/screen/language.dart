import 'package:e_commerce/core/constant/background.dart';
import 'package:e_commerce/view/widget/mybutton.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [const Background(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Text("1".tr, style:Theme.of(context).textTheme.headline1,),
                const SizedBox(height: 30,),
                CustomButton(name: "AR", onPressed: (){
                  controller.changeLang("AR");
                  Get.toNamed(AppRoute.onBoarding);
                }),
                const SizedBox(height: 10,),
                CustomButton(name: "EN", onPressed: (){
                  controller.changeLang("EN");
                  Get.toNamed(AppRoute.onBoarding);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
