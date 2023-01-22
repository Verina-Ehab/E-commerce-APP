import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductColors extends GetView<ProductControllerImp> {
  const ProductColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            ...List.generate(
              controller.productColorsList.length,
              (index) => Container(
                alignment: Alignment.center,
                margin: controller.lang == "EN"
                    ? const EdgeInsets.only(left: 10)
                    : const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: controller.productColorsList[index]['active'] == '1'
                        ? AppColor.fourthColor
                        : AppColor.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  controller.productColorsList[index]['name'],
                  style: TextStyle(
                      color: controller.productColorsList[index]['active'] == '1'
                          ? AppColor.white
                          : AppColor.fourthColor),
                ),
              ),
            ),
          ],
        );
  }
}