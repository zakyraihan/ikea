import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/features/carts/controller/cart_controller.dart';
import 'package:ikea/features/widget/ToSearchBarWidget.dart';
import 'package:ikea/features/widget/heading.dart';
import 'package:ikea/features/widget/ketegory.dart';
import 'package:ikea/features/widget/koleksi.dart';
import 'package:ikea/features/widget/product.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        scrolledUnderElevation: 2.5, // Add shadow when scrolling
        elevation: 0,
        backgroundColor: white,
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Image.asset('assets/images/logo.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Icon(
                  Iconsax.notification,
                  color: primaryText,
                  size: 26,
                ),
                const Gap(10),
                Obx(
                  () => IconButton(
                    onPressed: () => Get.toNamed('/cart'),
                    icon: Stack(
                      children: [
                        SizedBox(
                            height: 200,
                            width: 200,
                            child: Icon(
                              Icons.trolley,
                              color: primaryText,
                              size: 27,
                            )),
                        if (cartController.cartItems.isNotEmpty)
                          Positioned(
                            left: 14,
                            bottom: 14,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: Colors.red,
                              child: Text(
                                cartController.cartItems.length.toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              children: [
                const ToSearchBarWidget(),
                const SizedBox(height: 24),
                Image.asset('assets/images/banner.png'),
                const SizedBox(height: 24),
                const SizedBox(
                  height: 200,
                  child: Kategory(),
                ),
                const SizedBox(height: 24),
                const Heading(text: 'Produk Populer', text2: 'Lihat Semua'),
                const SizedBox(height: 16),
                const SizedBox(child: Product()),
                const SizedBox(height: 48),
                const Heading(
                    text: 'Telusuri Koleksi Kami', text2: 'Lihat Semua'),
                const SizedBox(height: 16),
                const SizedBox(child: KoleksiWidget())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
