import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTopPage extends GetView<ProductControllerImp> {
  const ProductTopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Positioned(
                top: 50.0,
                right: Get.width / 8,
                left: Get.width / 8,
                child: Hero(
                  tag: "${controller.itemsModel.itemsId}",
                  child: CachedNetworkImage(
                      height: 200,
                      fit: BoxFit.fill,
                      imageUrl:
                          "${AppLink.imagesItems}/${controller.itemsModel.itemsImage!}"),
                ),
              ),
            ),
          ],
        );
  }
}