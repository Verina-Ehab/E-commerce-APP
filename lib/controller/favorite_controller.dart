import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/favorite_data.dart';
import 'package:e_commerce/data/model/myfavourite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(String id, String val);
  addFavorite(String itemsId);
  removeFavorite(String itemsId);
  getData();
  deleteFromFavorite(String favoriteid);
}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};
  // key=>id
  // value=> 0 OR 1
  FavoriteData favoriteData = FavoriteData(Get.find());
  List<FavoriteModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  addFavorite(itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemsId);
    // print("========================== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Message",
            messageText: const Text("Successfully added to favorite!"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  removeFavorite(String itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, itemsId);
    // print("========================== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Message",
            messageText: const Text("Successfully removed from favorite!"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    // print("========================== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        data.addAll(response['data'].map((e) => FavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  deleteFromFavorite(favoriteid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    var response = favoriteData
        .deleteData(favoriteid);
    // print("========================== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if (response['status'] == "success") {
        // data.addAll(response['data']);
        data.removeWhere((element)=> element.favoriteId == favoriteid);
      // } 
      // else {
      //   statusRequest = StatusRequest.failure;
      // }
    }
    update();
  }
  
  
}
