import 'package:e_commerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
            // onBoardingList[i].image!,
            AppImageAsset.logo,
            width: 150,
            height: 150,
            fit: BoxFit.fill,
          );
  }
}