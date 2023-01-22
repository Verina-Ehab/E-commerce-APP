import 'package:flutter/material.dart';
import 'package:e_commerce/core/constant/color.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final void Function()? onPressed;

  const CustomButton({this.onPressed, Key? key, 
    required this.name,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: EdgeInsets.symmetric(horizontal: 40),
      height: 45,
      child: MaterialButton(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: const BorderSide(color: Colors.transparent)),
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        color: AppColor.primaryColor,
        onPressed: onPressed,
        textColor: Colors.white,
        child: Text(
          name, style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
