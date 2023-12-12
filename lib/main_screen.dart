// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/controller/mainscreen_controller.dart';
import 'package:ikea/features/beranda/bottomnavbar/bottom_navbar.dart';
import 'package:ikea/features/beranda/screen/beranda_screen.dart';
import 'package:ikea/features/inspirasi/screen/inspiration_screen.dart';
import 'package:ikea/features/profile/screen/profile_screen.dart';
import 'package:ikea/features/whislist/screen/whislist_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final List<Widget> pageList = [
    BerandaScreen(),
    InspirationScreen(),
    WhislistScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: white,
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}
