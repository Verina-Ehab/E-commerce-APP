import 'package:e_commerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessController extends GetxController{
  goToLogin();
}

class SuccessControllerImp extends SuccessController{
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

}