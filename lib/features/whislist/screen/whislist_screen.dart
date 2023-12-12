import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/features/carts/controller/cart_controller.dart';
import 'package:ikea/features/whislist/controller/whislist_controller.dart';

class WhislistScreen extends StatefulWidget {
  const WhislistScreen({super.key});

  @override
  State<WhislistScreen> createState() => _WhislistScreenState();
}

class _WhislistScreenState extends State<WhislistScreen> {
  final WhislistController whislistController = Get.find();
  final CartController whislistControllers = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          'Whislist',
          style: style(primaryText, 18, FontWeight.w600, 0),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: primaryText,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () => Get.toNamed('/cart'),
              icon: Icon(
                Iconsax.bag,
                color: primaryText,
                size: 26,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => whislistController.whislistItems.isEmpty
            ? Center(
                child: Image.network(
                    'https://i.pinimg.com/originals/f6/e4/64/f6e464230662e7fa4c6a4afb92631aed.png'),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.search,
                          color: primaryText,
                        ),
                        hintText: 'Cari barang diwishlist',
                        hintStyle: style(secondText, 16, FontWeight.w400, 0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${whislistController.whislistItems.length}',
                                  style: style(
                                      primaryText, 14, FontWeight.w600, 0),
                                ),
                                TextSpan(
                                  text: 'Barang',
                                  style:
                                      style(secondText, 14, FontWeight.w400, 0),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              whislistController.clearWhislist(context);
                            },
                            child: Text(
                              'Hapus semua',
                              style: style(primary, 14, FontWeight.w600, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: whislistController.whislistItems.length,
                        itemBuilder: (context, index) {
                          final product =
                              whislistController.whislistItems[index];
                          return Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    product.imageAsset,
                                    height: 90,
                                    width: 90,
                                  ),
                                  const Gap(12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            product.title,
                                            overflow: TextOverflow.ellipsis,
                                            style: style(primaryText, 16,
                                                FontWeight.w600, 0),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.more_vert,
                                              size: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      const Gap(6),
                                      Text(
                                        product.description,
                                        overflow: TextOverflow.ellipsis,
                                        style: style(
                                            secondText, 14, FontWeight.w400, 0),
                                      ),
                                      const Gap(12),
                                      Text(
                                        'Rp${product.price}00',
                                        style: style(primaryText, 16,
                                            FontWeight.w600, 0),
                                      ),
                                      const Gap(12),
                                      GestureDetector(
                                        onTap: () {
                                          whislistControllers
                                              .addToCart(product);
                                          Get.snackbar(
                                            onTap: (snack) =>
                                                Get.to(const WhislistScreen()),
                                            'Success',
                                            'Added to Cart',
                                            backgroundColor: primary,
                                            colorText: white,
                                          );
                                        },
                                        child: Container(
                                          width: 240,
                                          height: 38,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: primary,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Tambah ke Keranjang',
                                              style: style(primary, 14,
                                                  FontWeight.w500, 0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
