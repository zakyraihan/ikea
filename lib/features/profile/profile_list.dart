import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ikea/color/constant_color.dart';

List<Widget> profile = [
  const Divider(),
  ListTile(
    leading: Icon(Icons.person, color: primaryText, size: 26),
    title: Text(
      'Profil Saya',
      style: style(primaryText, 16, FontWeight.w500, 0),
    ),
  ),
  const Divider(),
  ListTile(
    leading: Icon(Icons.check_box_rounded, color: primaryText, size: 26),
    title: Text(
      'Pesanan',
      style: style(primaryText, 16, FontWeight.w500, 0),
    ),
  ),
  const Divider(),
  ListTile(
    leading: Icon(Icons.star_border, color: primaryText, size: 26),
    title: Text(
      'Ulasan',
      style: style(primaryText, 16, FontWeight.w500, 0),
    ),
  ),
  const Divider(),
  ListTile(
    leading: Icon(Iconsax.gift, color: primaryText, size: 26),
    title: Text(
      'Reward Saya',
      style: style(primaryText, 16, FontWeight.w500, 0),
    ),
  ),
  const Divider(),
  ListTile(
    leading: Icon(Icons.question_answer_outlined, color: primaryText, size: 26),
    title: Text(
      'Bantuan',
      style: style(primaryText, 16, FontWeight.w500, 0),
    ),
  ),
  const Divider(),
  ListTile(
    leading: Icon(Icons.star_border, color: primaryText, size: 26),
    title: Text(
      'Ulasan',
      style: style(primaryText, 16, FontWeight.w500, 0),
    ),
  ),
  const Divider(),
];
