// import 'package:e_commerce/controller/checkemail_controller.dart';
// import 'package:e_commerce/core/constant/background.dart';
// import 'package:e_commerce/core/functions/validinput.dart';
// import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
// import 'package:e_commerce/view/widget/custombutton.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CheckEmail extends StatelessWidget {
//   const CheckEmail({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         title: const Text('Check Email'),
//       ),
//       body: Stack(
//         children: [
//           const Background(),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//             child: ListView(
//               children: [
//                 Text(
//                   "Account successfully created",
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context).textTheme.headline2,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 25),
//                   child: Text(
//                     "Please enter your email address to recieve a varificatin code",
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context).textTheme.bodyText1,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 CustomTextFormAuth(
//                     valid: (val) {
//                       return validInput(val!, 5, 100, "email");
//                     },
//                     myController: controller.email,
//                     label: "Email",
//                     hint: "Enter your email"),
//                 CustomButton(
//                     name: "Check",
//                     onPressed: () {
//                       controller.goToVerifyCode();
//                     }),
//                 const SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
