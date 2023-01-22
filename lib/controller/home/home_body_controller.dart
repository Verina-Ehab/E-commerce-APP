import 'package:e_commerce/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

abstract class HomeBodyController extends GetxController{
  changePage(int currentPage);
}

class HomeBodyControllerImp extends HomeBodyController{

  int currentPage=0;
  List<Widget> listPage=[
    const Home(),
    const Text("Favourite"),
    const Text("Profile"),
    const Text("Setting"),
  ];
  List listTitleNavigationButton=[
    "Home","Favourite","Profile","Setting"
  ];


  @override
  changePage(int currentPage) {
    throw UnimplementedError();
  }
}