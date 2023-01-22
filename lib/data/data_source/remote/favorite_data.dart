import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(
    this.crud,
  );

  addFavorite(String usersId, String itemsId) async {
    var response = await crud.postData(
        AppLink.favoriteAdd, {"usersid": usersId, "itemsid": itemsId});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersId, String itemsId) async {
    var response =
        await crud.postData(AppLink.favoriteRemove, {"usersid": usersId, "itemsid": itemsId});
    return response.fold((l) => l, (r) => r);
  }

  getData(String id) async {
    var response =
        await crud.postData(AppLink.favoriteView, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response =
        await crud.postData(AppLink.favoriteView, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

}
