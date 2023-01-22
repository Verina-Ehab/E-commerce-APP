// ???????????????????????????????????????

import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/db_translation.dart';
import 'package:e_commerce/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsCategoriesListWithBorder extends GetView<ItemsControllerImp> {
  const ItemsCategoriesListWithBorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          itemCount: controller.categories.length,
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Category(
              i: index,
                categoriesModel: CategoriesModel.fromJson(controller.categories[index]));
          })),
    );
  }
}

class Category extends GetView<ItemsControllerImp> {
  const Category({
    Key? key,
    required this.i,
    required this.categoriesModel,
  }) : super(key: key);

  final CategoriesModel categoriesModel;
  final int? i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(controller.categories, i!);
        controller.changeCat(i!,
            categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                    decoration: controller.selectedCat == i
                        ? BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 3, color: AppColor.primaryColor)),
                          )
                        : null,
                    child: Text(
                        "${dbTranslation(categoriesModel.categoriesNameAr, categoriesModel.categoriesNameEn)}"),
                  ))
        ],
      ),
    );
  }
}

// controller.categories[index]['categories_name']
// Text("${CategoriesModel.fromJson(controller.categories[i]).categoriesNameEn}"),