// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class Bottomnav extends StatelessWidget {
  const Bottomnav({super.key, this.onTap, this.icon, this.label, this.color});

  final void Function()? onTap;
  final IconData? icon;
  final String? label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height / 16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            SizedBox(height: 3),
            if (label != null)
              Text(
                label!,
                style: TextStyle(
                  color: color,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
