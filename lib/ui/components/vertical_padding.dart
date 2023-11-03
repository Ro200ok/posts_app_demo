import 'package:flutter/material.dart';

class VertiacalPadding extends StatelessWidget {
  const VertiacalPadding({super.key, required this.child, this.padding = 10});
  final Widget child;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: child,
    );
  }
}
