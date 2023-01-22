import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? suffix;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final TextInputType? type;
  final bool? obsecure;
  final void Function()? ontap;

  const CustomTextFormAuth({
    Key? key,
    required this.label,
    required this.hint,
    this.suffix,
    this.myController,
    required this.valid,
    this.type,
    this.obsecure,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        obscureText: obsecure == false || obsecure == null ? false : true,
        keyboardType: type,
        validator: valid,
        controller: myController,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(label),
            ),
            suffixIcon: InkWell(
              onTap: ontap,
              child: Icon(suffix),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
      ),
    );
  }
}
