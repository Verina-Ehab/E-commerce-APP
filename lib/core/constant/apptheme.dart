import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "BebasNeue",
  textTheme: TextTheme(
      headline1: TextStyle(
          color: AppColor.white, fontWeight: FontWeight.bold, fontSize: 23),
      bodyText1: TextStyle(
          // height: 2,
          letterSpacing: 1,
          color: AppColor.white,
          // fontWeight: FontWeight.bold,
          fontSize: 13),
      //for buttons' name
      headline2: TextStyle(
          height: 2,
          letterSpacing: 1,
          color: AppColor.white,
          fontWeight: FontWeight.bold,
          fontSize: 16)),
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
      headline1: TextStyle(
          color: AppColor.white, fontWeight: FontWeight.bold, fontSize: 23),
      bodyText1: TextStyle(
          // height: 2,
          letterSpacing: 1,
          color: AppColor.white,
          // fontWeight: FontWeight.bold,
          fontSize: 13),
      //for buttons' name
      headline2: TextStyle(
          height: 2,
          letterSpacing: 1,
          color: AppColor.white,
          fontWeight: FontWeight.bold,
          fontSize: 16)),
);
