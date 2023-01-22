import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud,);
  
  getData() async{
    var response= await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
