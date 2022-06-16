import 'package:flutter/material.dart';

import 'custome_text.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.imageName})
      : super(key: key);
  final void Function() onPressed;

  final String text;

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Image.asset(imageName),
            const SizedBox(width: 80),
            CustomText(
              text: text,
              fontSize: 14,
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(10)),
          primary: Colors.white,
          minimumSize: const Size(50, 60),
        ),
      ),
    );
  }
}
