import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ProductController extends GetxController {}

class ProductControllerImp extends ProductController {
  late ItemsModel itemsModel;
  MyServices myServices = Get.find();
  String? lang;
  List productColorsList = [
    {
      "name": "red",
      "id": 1,
      "active": "0",
    },
    {
      "name": "blue",
      "id": 2,
      "active": "0",
    },
    {
      "name": "black",
      "id": 3,
      "active": "1",
    },
  ];

  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    itemsModel = Get.arguments['itemsmodel'];
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
