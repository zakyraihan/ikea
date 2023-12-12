import 'package:flutter/material.dart';
import 'package:ikea/color/constant_color.dart';

class Heading extends StatelessWidget {
  final String text;
  final String text2;

  const Heading({Key? key, required this.text, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            color: primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: 14.0,
            color: primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
