import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/middleware/my_middleware.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:e_commerce/view/screen/auth/successsignup.dart';
import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/screen/language.dart';
import 'package:e_commerce/view/screen/favorite.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:e_commerce/view/screen/product.dart';
import 'package:e_commerce/view/widget/home/home_items_list.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  //onBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  
  //MiddleWare
  GetPage(name: "/", page: () => const Language(), middlewares: [
    MyMiddleWare(),
  ]),
  // GetPage(name: "/", page: () => const Test()),

  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),

  //Home
  GetPage(name: AppRoute.home, page: () => const Home()),
  GetPage(name: AppRoute.items, page: () => const HomeItemsList()),
  GetPage(name: AppRoute.product, page: () => const Product()),
  GetPage(name: AppRoute.myFavorite, page: () => const Favorite()),
];















// Map<String, Widget Function(BuildContext)> routess = {
//   // OnBoarding
//   AppRoute.onBoarding: (context) => const OnBoarding(),
//   // Auth
//   AppRoute.login: (context) => const Login(),
//   AppRoute.signUp: (context) => const SignUp(),
//   AppRoute.verifyCode: (context) => const VerifyCode(),
//   AppRoute.forgetPassword: (context) => const ForgetPassword(),
//   AppRoute.resetPassword: (context) => const ResetPassword(),
//   AppRoute.successSignUp: (context) => const SuccessSignUp(),
//   AppRoute.successResetPassword: (context) => const SuccessResetPassword(),
//   // AppRoute.checkEmail: (context) => const CheckEmail(),
// };
