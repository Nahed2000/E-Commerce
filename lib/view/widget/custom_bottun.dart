import 'package:flutter/material.dart';

import '../../constance.dart';
import 'custome_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.height,
      required this.onPressed})
      : super(key: key);
  final String text;
  final double height;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: CustomText(
        color: Colors.white,
        alignment: Alignment.center,
        text: text,
        fontSize: 18,
      ),
      style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: Size(double.infinity, height)),
    );
  }
}
