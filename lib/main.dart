import 'package:e_commerce/binding/initial_binding.dart';
import 'package:e_commerce/core/localization/changelocal.dart';
import 'package:e_commerce/core/localization/translation.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller= Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      theme: controller.appTheme,
      initialBinding: InitialBinding(),
      // routes: routes,
      // getPages: routes,
      home: const Home(),
    );
  }
}
