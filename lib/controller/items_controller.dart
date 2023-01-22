import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_source/remote/items_data.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController{
  initialData();
  changeCat(int val, String catVal);
  getItems(String catID);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController{
  List categories=[];
  int? selectedCat;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices= Get.find();
  String? catID;
  
  @override
  initialData() {
    categories= Get.arguments['categories'];
    selectedCat= Get.arguments['selectedcat'];
    catID = Get.arguments['categoryid'];
    getItems(catID!);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
  
  @override
  changeCat(val, catVal) {
    selectedCat= val;
    catID= catVal;
    getItems(catID!);
    update();
  }

  @override
  getItems(catID) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(catID);
    // print("========================== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  goToProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
    throw UnimplementedError();
  }

}