import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/db_translation.dart';
import 'package:e_commerce/data/model/categories_model.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeCategoriesList extends GetView<HomeControllerImp> {
  const HomeCategoriesList({
    // required this.i,required this.categoriesModel, 
    Key? key})
      : super(key: key);

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
            return Category(i: index, categoriesModel: CategoriesModel.fromJson(controller.categories[index]),);
          })),
    );
  }
}

class Category extends GetView<HomeControllerImp> {
    final CategoriesModel categoriesModel;
  final int? i ;
  const Category({
    Key? key, required this.categoriesModel, this.i,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i!, categoriesModel.categoriesId! );
      },
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.network(
                "${AppLink.imagesCategories}/${categoriesModel.categoriesImage}"),
          ),
          Text("${dbTranslation(categoriesModel.categoriesNameAr, categoriesModel.categoriesNameEn)}")
        ],
      ),
    );
  }
}

// Text("${controller.categories[index]['categories_name']}")
// SvgPicture.network(
                // "${AppLink.imagesCategories}/${controller.categories[i]['categories_image']}"),