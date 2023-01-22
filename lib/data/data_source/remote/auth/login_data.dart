import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud,);
  
  postData(String email, String password) async{
    var response= await crud.postData(AppLink.logIn, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
