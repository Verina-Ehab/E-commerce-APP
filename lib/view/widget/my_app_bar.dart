import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String textFieldName;
  // final IconData textFieldIcon;
  final IconData actionIcon;
  final void Function()? actionOnPress;

  const MyAppBar({
    Key? key,
    // required this.textFieldName,
    required this.actionOnPress,
    required this.actionIcon,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
          title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: InputDecoration(
                  prefix: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: (){},                    
                  ),
                  hintText: "Find Products",
                  border: const OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          actions: [
            IconButton(
                onPressed: actionOnPress,
                icon: Icon(
                  actionIcon,
                  size: 30,
                ))
          ],
        );
  }
}
