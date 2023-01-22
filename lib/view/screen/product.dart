import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/db_translation.dart';
import 'package:e_commerce/view/widget/product/product_colors.dart';
import 'package:e_commerce/view/widget/product/product_count.dart';
import 'package:e_commerce/view/widget/product/product_top_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends GetView<ProductControllerImp> {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    // ProductControllerImp controller = Get.put(ProductControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        height: 40.0,
        margin: const EdgeInsets.all(10.0),
        child: MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: AppColor.thirdColor,
          child: const Text("Add to cart"),
        ),
      ),
      body: ListView(children: [
        const ProductTopPage(),
        const SizedBox(
          height: 10.0,
        ),
        Text(dbTranslation(controller.itemsModel.itemsNameAr!,
            controller.itemsModel.itemsNameEn!)),
        const SizedBox(
          height: 8.0,
        ),
        ProductCountPrice(
            count: controller.itemsModel.itemsCount!,
            price: controller.itemsModel.itemsPrice!),
        const SizedBox(
          height: 15.0,
        ),
        Text(dbTranslation(controller.itemsModel.itemsDescAr!,
            controller.itemsModel.itemsDescEn!)),
        const SizedBox(
          height: 20.0,
        ),
        const Text("Color"),
        const ProductColors()
      ]),
    );
  }
}

