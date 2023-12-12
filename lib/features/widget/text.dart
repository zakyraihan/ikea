// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ikea/color/constant_color.dart';

class TextWidget extends StatefulWidget {
  final String title;
  final String desc;

  const TextWidget({Key? key, required this.title, required this.desc})
      : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20.0,
                color: primaryText,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: isFavorite
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(
          widget.desc,
          style: TextStyle(
            fontSize: 16.0,
            color: secondText,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
