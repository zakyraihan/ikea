// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/features/carts/screen/cart_screen.dart';
import 'package:ikea/model/model.dart';

class InspirationScreen extends StatefulWidget {
  const InspirationScreen({super.key});

  @override
  State<InspirationScreen> createState() => _InspirationScreenState();
}

class _InspirationScreenState extends State<InspirationScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              shape: Border(
                bottom: BorderSide(color: secondLine),
              ),
              titleSpacing: 24,
              backgroundColor: white,
              toolbarHeight: 85,
              pinned: true, // Set pinned menjadi true untuk membuatnya melekat
              floating:
                  true, // Set floating menjadi true agar SliverAppBar muncul ketika scrolling ke atas
              title: Text(
                'Temukan Inspirasi',
                style: style(primaryText, 18, FontWeight.w600, 0),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.notification,
                        color: primaryText,
                        size: 26,
                      ),
                      const SizedBox(width: 24),
                      GestureDetector(
                        onTap: () => Get.to(CartScreen()),
                        child: Icon(
                          Icons.trolley,
                          color: primaryText,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              bottom: TabBar(
                indicatorColor: primary,
                padding: const EdgeInsets.only(right: 50),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3.5, color: primary),
                  insets: const EdgeInsets.symmetric(horizontal: 20.0),
                ),
                tabs: [
                  Tab(
                    child: Text(
                      'Inspirasi',
                      style: style(primaryText, 16, FontWeight.w500, 0),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Koleksi',
                      style: style(primaryText, 16, FontWeight.w500, 0),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Edukasi',
                      style: style(primaryText, 16, FontWeight.w500, 0),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(left: 24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Option(0, 'Semua', 96.0),
                            const Gap(16),
                            Option(1, 'Ruang Kerja', 127),
                            const Gap(16),
                            Option(2, 'Dapur', 88),
                            const Gap(16),
                            Option(3, 'Ruang Keluarga', 127),
                            const Gap(16),
                          ],
                        ),
                      ),
                    ),
                    const Gap(24),
                    ...inspirasiSemua.map((e) => e)
                  ],
                ),
              ],
            ),
            const Center(
              child: Text('Koleksi'),
            ),
            const Center(
              child: Text('Edukasi'),
            ),
          ],
        ),
      ),
    );
  }

  Widget Option(int index, String label, double width) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: width,
        height: 48,
        decoration: BoxDecoration(
          color: selectedIndex == index ? primary : null,
          border: Border.all(
            color: selectedIndex == index ? primary : const Color(0xFFE7E7E7),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: style(selectedIndex == index ? white : primaryText, 14,
                FontWeight.w500, 0),
          ),
        ),
      ),
    );
  }
}
