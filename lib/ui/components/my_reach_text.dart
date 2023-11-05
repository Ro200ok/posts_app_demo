import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  const MyRichText(
      {super.key,
      this.description = '',
      required this.item,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign,
      this.textStyle});

  final String? description;
  final TextStyle? textStyle;
  final String? item;
  final double? fontSize;
  final FontWeight? fontWeight;
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
      textScaleFactor: .9,
      maxLines: 4,
      textAlign: textAlign,
    );
  }
}
