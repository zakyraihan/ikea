// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/controller/mainscreen_controller.dart';
import 'package:ikea/features/beranda/bottomnavbar/bottomnav.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, MainScreenNotifier, child) {
      return Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: Container(
          padding: EdgeInsets.all(11),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Bottomnav(
                onTap: () {
                  MainScreenNotifier.pageIndex = 0;
                },
                color: MainScreenNotifier.pageIndex == 0 ? primary : secondText,
                icon:
                    MainScreenNotifier.pageIndex == 0 ? Icons.home : Icons.home,
                label: 'Beranda',
              ),
              Bottomnav(
                onTap: () {
                  MainScreenNotifier.pageIndex = 1;
                },
                color: MainScreenNotifier.pageIndex == 1 ? primary : secondText,
                icon: MainScreenNotifier.pageIndex == 1
                    ? Iconsax.coffee
                    : Iconsax.coffee,
                label: 'Inspiration',
              ),
              Bottomnav(
                onTap: () {
                  MainScreenNotifier.pageIndex = 2;
                },
                color: MainScreenNotifier.pageIndex == 2 ? primary : secondText,
                icon: MainScreenNotifier.pageIndex == 2
                    ? Icons.favorite
                    : Icons.favorite_outline,
                label: 'Wishlist',
              ),
              Bottomnav(
                onTap: () {
                  MainScreenNotifier.pageIndex = 3;
                },
                color: MainScreenNotifier.pageIndex == 3 ? primary : secondText,
                icon: Iconsax.profile_circle,
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    });
  }
}
