import 'package:e_commerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return SizedBox(height: size.height,
      child: Image.asset(
        AppImageAsset.background,
        fit: BoxFit.fill,
        // width: size.width,
      ),
    );
  }
}
