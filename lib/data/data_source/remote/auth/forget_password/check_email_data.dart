import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud,);
  
  postData(String email) async{
    var response= await crud.postData(AppLink.checkEmail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
