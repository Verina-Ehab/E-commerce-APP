import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/data/model/myfavourite_model.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteItem extends GetView<ItemsControllerImp> {
  // final ItemsModel itemsModel;
  final FavoriteModel itemsModel;
  final int index;
  const FavoriteItem(this.index, {super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: "${AppLink.imagesItems}/${itemsModel.itemsImage}",
              height: 100,
              fit: BoxFit.fill,
            ),
            Text(controller.data[index].itemsName!),
            Row(),
            Row(children: [const Text("data"), IconButton(onPressed: () {
              
            }, icon: const Icon(Icons.delete_outline))],)
          ],
        ),
      ),
    );
  }
}
