import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/features/profile/profile_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        titleSpacing: 24,
        title: Text(
          'Menu Akun',
          style: style(primaryText, 18, FontWeight.w600, 0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: primaryText,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/barcode.png',
                  height: 84,
                ),
                const Gap(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rizqi Fatur',
                      style: style(primaryText, 16, FontWeight.w600, 0),
                    ),
                    Text(
                      '160002359102020',
                      style: style(secondText, 14, FontWeight.w400, 0),
                    ),
                  ],
                )
              ],
            ),
            const Gap(24),
            Expanded(
              child: ListView(
                children: [...profile.map((e) => e)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
