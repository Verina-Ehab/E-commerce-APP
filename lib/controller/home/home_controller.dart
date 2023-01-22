import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/home_data.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, String catID);
  goToFavourite();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());

  late StatusRequest statusRequest;

  List categories = [];
  List items = [];
  String? usrname;
  String? id;
  String? lang;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    usrname = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    // print("========================== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, catID) {
    Get.toNamed(AppRoute.items,
        arguments: {"categories": categories, "selectedcat": selectedCat, "categoryid": catID});
  }
  
  @override
  goToFavourite() {
    Get.toNamed(AppRoute.myFavorite,);
  }
}
