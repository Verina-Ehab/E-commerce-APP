import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/annoucement_card.dart';
import 'package:e_commerce/view/widget/home/home_categories_list.dart';
import 'package:e_commerce/view/widget/home/home_items_list.dart';
import 'package:e_commerce/view/widget/my_app_bar.dart';
import 'package:e_commerce/view/widget/mybottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeControllerImp> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
        appBar: MyAppBar(
            actionIcon: Icons.notifications,
            actionOnPress: controller.goToFavourite()),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {},
          child: const Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const MyBottomAppBar(),
        body: GetBuilder<HomeControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: HomeBody(),
                  ),
                )));
  }
}

class HomeBody extends StatelessWidget {
  // final CategoriesModel categoriesModel;
  // final int? i ;
  const HomeBody({
    // required this.i,required this.categoriesModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AnnoucementCard(title: "A summer surprize", body: "Cashback 20%"),
        const Text("Categories"),
        const HomeCategoriesList(),
        const SizedBox(
          height: 10,
        ),
        Text("4".tr
            // "Products for you"
            ),
        const SizedBox(
          height: 10,
        ),
        const HomeItemsList(),
      ],
    );
  }
}
