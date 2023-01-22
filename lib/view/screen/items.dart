import 'package:e_commerce/controller/favorite_controller.dart';
import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/view/widget/items/items_categories_list_withborder.dart';
import 'package:e_commerce/view/widget/items/items_2d_list.dart';
import 'package:e_commerce/view/widget/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key
      ,required this.itemsModel
      });

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    return Scaffold(
      appBar: MyAppBar(actionOnPress: () {}, actionIcon: Icons.favorite),
      body: Container(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              const ItemsCategoriesListWithBorder(),
              GetBuilder<ItemsControllerImp>(builder: (controller) {
                return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: ((context, index) {
                          controllerFav.isFavorite[controller.data[index]
                                  ['items_id']] =
                              controller.data[index]['favorite'];
                          return Items2Dlist(
                            iconButton: controllerFav.isFavorite[itemsModel.itemsId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_outline_rounded,
                            onPressButton: (){
                              if (controllerFav.isFavorite[itemsModel.itemsId] ==
                              "1") {
                            controllerFav.setFavorite(itemsModel.itemsId!, "0");
                            controllerFav.removeFavorite(itemsModel.itemsId!);
                          } else {
                            controllerFav.setFavorite(itemsModel.itemsId!, "1");
                            controllerFav.addFavorite(itemsModel.itemsId!);
                          }
                            },
                              // active: false,
                              itemsModel:
                                  ItemsModel.fromJson(controller.data[index]));
                        })));
              }),
            ],
          )),
    );
  }
}
