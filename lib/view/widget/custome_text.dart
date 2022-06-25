import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {required this.text,
        this.maxLine = 1,
        this.height = 1,
      required this.fontSize,
      this.alignment = Alignment.topLeft,
      this.color = Colors.black,
      Key? key})
      : super(key: key);

  final String text;
  final double fontSize;
  final Alignment alignment;
  final Color color;
  final int maxLine ;
  final double height ;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        maxLines: maxLine,
        overflow:TextOverflow.ellipsis ,
        style: TextStyle(
          height: height,
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }
}
