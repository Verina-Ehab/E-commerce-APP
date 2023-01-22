import 'package:flutter/material.dart';

import 'package:e_commerce/core/constant/color.dart';

class CustomInkWell extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final TextAlign align;


  const CustomInkWell({
    Key? key,
    required this.text,
    this.onPressed,
    this.align= TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 3),
      child: InkWell(
          onTap: onPressed,
          child: Text(
            text,
            textAlign: align,
            style: TextStyle(color: AppColor.primaryColor),
          )),
    );
  }
}
