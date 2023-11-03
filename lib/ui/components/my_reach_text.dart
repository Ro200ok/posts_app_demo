import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  const MyRichText(
      {super.key,
      required this.description,
      required this.item,
      required this.fontSize,
      required this.fontWeight,
      required this.color,
      this.textAlign});

  final String? description;
  final String item;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: description,
          style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
        ),
        TextSpan(
          text: item,
          style: TextStyle(
              fontWeight: fontWeight, fontSize: fontSize, color: color),
        )
      ]),
      textAlign: textAlign,
    );
  }
}
