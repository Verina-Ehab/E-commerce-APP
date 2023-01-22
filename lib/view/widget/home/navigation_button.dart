import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String name;
  final bool? active;

  const NavigationButton(
      {super.key,
      this.onPressed,
      required this.icon,
      required this.name,
      this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? AppColor.primaryColor : AppColor.grey2,
          ),
          Text(
            name,
            style: TextStyle(
              color: active == true ? AppColor.primaryColor : AppColor.grey2,
            ),
          )
        ],
      ),
    );
  }
}
