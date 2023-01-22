import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

dbTranslation(columnAR, columnEN){
  MyServices myServices= Get.find();

  if(myServices.sharedPreferences.getString("lang") == "AR"){
    return columnAR;
  }else{
    return columnEN;
  }
}