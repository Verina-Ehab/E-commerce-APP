import 'package:e_commerce/controller/home/home_body_controller.dart';
import 'package:e_commerce/view/widget/home/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBodyControllerImp>(
        builder: (controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              // notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(
                    controller.listPage.length + 1,
                    (index) {
                      int i = index > 2 ? index - 1 : index;
                      return index == 2
                          ? const Spacer()
                          : NavigationButton(
                              icon: Icons.home,
                              name: controller.listTitleNavigationButton[i],
                              onPressed: () {
                                controller.changePage(i);
                              },
                              active:
                                  controller.currentPage == i ? true : false,
                            );
                    },
                  )
                  //   Row(
                  //     children: [
                  //       NavigationButton(
                  //         icon: Icons.home,
                  //         name: "Home",
                  //         onPressed: () {
                  //           controller.changePage(0);
                  //         },
                  //         active: controller.currentPage == 0 ? true : false,
                  //       ),
                  //       NavigationButton(
                  //         icon: Icons.favorite,
                  //         name: "Favourite",
                  //         onPressed: () {
                  //           controller.changePage(1);
                  //         },
                  //         active: controller.currentPage == 1 ? true : false,
                  //       ),
                  //     ],
                  //   ),
                  //   Spacer(),
                  //   Row(
                  //     children: [
                  //       NavigationButton(
                  //         icon: Icons.account_circle,
                  //         name: "Profile",
                  //         onPressed: () {
                  //           controller.changePage(2);
                  //         },
                  //         active: controller.currentPage == 2 ? true : false,
                  //       ),
                  //       NavigationButton(
                  //         icon: Icons.settings,
                  //         name: "Setting",
                  //         onPressed: () {
                  //           controller.changePage(3);
                  //         },
                  //         active: controller.currentPage == 3 ? true : false,
                  //       ),
                  //     ],
                  //   ),
                ],
              ),
            ));
  }
}
