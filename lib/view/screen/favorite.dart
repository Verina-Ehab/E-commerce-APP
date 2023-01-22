import 'package:e_commerce/controller/favorite_controller.dart';
import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/view/widget/items/items_2d_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends GetView<FavoriteControllerImp> {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    // FavoriteControllerImp controller = //because we'll put "GetBuilder"
    // Get.put(FavoriteControllerImp());
    ItemsControllerImp controllerItem = Get.put(ItemsControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Title'),
      // ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return
                        // FavoriteItem(index, itemsModel: controller.data[index])
                        Items2Dlist(iconButton: Icons.delete_outline_outlined ,
                          itemsModel: 
                        // controller.data[index]
                        ItemsModel.fromJson(controllerItem.data[index]),
                        onPressButton:(){
                          controller.deleteFromFavorite(controller.data[index].favoriteId!);
                        } ,
                        );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
