import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeItemsList extends GetView<HomeControllerImp> {
  const HomeItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                        "${AppLink.imagesItems}/${controller.items[index]['items_image']}",
                        height: 100,
                        width: 150,
                        fit: BoxFit.fill),
                  ),
                  Container(
                    height: 120,
                    width: 180,
                    decoration: BoxDecoration(
                        color: AppColor.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Positioned(
                      left: 10,
                      child: Text("${controller.items[index]['items_name']}"))
                ],
              );
            }));
  }
}
