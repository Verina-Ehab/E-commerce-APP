import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/favorite_controller.dart';
import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/db_translation.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class Items2Dlist extends GetView<ItemsControllerImp> {
  final void Function()? onPressButton;
  final ItemsModel itemsModel;
  final IconData? iconButton;
  // final bool active;
  const Items2Dlist(
      {
      // required this.active,
      super.key,
      required this.iconButton,
      required this.onPressButton,
      required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: const [],
            ),
            Hero(
              tag: "${itemsModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imagesItems}/${itemsModel.itemsImage}",
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                "${dbTranslation(itemsModel.itemsNameAr, itemsModel.itemsNameEn)}"),
            // Text(itemsModel.itemsNameEn!),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Rating 3.5",
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    ...List.generate(
                        5,
                        (index) => Icon(
                              Icons.star,
                              size: 15,
                              color: AppColor.yellow,
                            ))
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${itemsModel.itemsPrice} \$"),
                GetBuilder<FavoriteControllerImp>(
                    builder: (controller) => IconButton(
                        onPressed: () {
                          onPressButton;
                        },
                        color: AppColor.primaryColor,
                        icon: Icon( iconButton)))
              ],
            )
          ],
        ),
      ),
    );
  }
}

// icon: Icon(itemsModel.favorite == "1"
//                         ? Icons.favorite
//                         : Icons.favorite_outline_rounded)))
