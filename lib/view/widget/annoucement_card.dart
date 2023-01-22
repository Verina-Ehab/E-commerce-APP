import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/core/constant/color.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AnnoucementCard extends GetView<HomeControllerImp> {
 final  String title;
  final String body;

  const AnnoucementCard({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListTile(
            title: Text(title), subtitle: Text(body)),
        Positioned(
            top: -20,
            right: controller.lang =="EN" ? -20 : null ,
            left: controller.lang =="AR" ? -20 : null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(160)),
            ))
      ],
    );
  }
}
