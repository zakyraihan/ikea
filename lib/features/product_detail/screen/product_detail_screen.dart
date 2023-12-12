import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/features/carts/controller/cart_controller.dart';
import 'package:ikea/features/search/screen/search_screen.dart';
import 'package:ikea/features/whislist/controller/whislist_controller.dart';
import 'package:ikea/features/whislist/screen/whislist_screen.dart';
import 'package:ikea/model/model.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final CartController cartController = Get.find();
  final WhislistController whislistController = Get.find();

  final product = Get.arguments;
  int qty = 1;
  Color qtyColor = primary;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments['e'];
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        scrolledUnderElevation: 2.5, // Add shadow when scrolling
        elevation: 0,
        backgroundColor: white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
          color: primaryText,
        ),
        title: Text(
          product.title,
          style: style(primaryText, 18, FontWeight.w600, 0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const SearchPage());
                  },
                  child: Icon(
                    Icons.search,
                    color: primaryText,
                    size: 27,
                  ),
                ),
                const Gap(10),
                Icon(
                  Icons.share,
                  color: primaryText,
                  size: 27,
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
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: [
                    Image.asset(product.imageAsset),
                  ],
                  options: CarouselOptions(),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          ...product.imageDetail.map((url) {
                            return Image.asset(url);
                          }).toList()
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // TextWidget(title: product.title, desc: product.description),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
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
                          if (isFavorite) {
                            // Add the product to the wishlist
                            whislistController.addToWhislist(product);
                            Get.snackbar(
                              onTap: (snack) => Get.to(const WhislistScreen()),
                              'Success',
                              'Added to Wishlist',
                              backgroundColor: primary,
                              colorText: white,
                            );
                          } else {
                            // Remove the product from the wishlist if needed
                            // whislistController.removeFromWhislist(product);
                          }
                        });
                      },
                      icon: isFavorite
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_border),
                    )
                  ],
                ),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: secondText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Rp${product.price}00',
                  style: style(primaryText, 24, FontWeight.w700, 0),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    ...star.map((e) => e),
                    const Text('4.5 | Terjual 116'),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Ruang terbatas bukan berarti Anda harus menolak belajar atau bekerja dari rumah. Meja ini memakan sedikit ruang lantai namun masih memiliki unit laci tempat Anda dapat menyimpan kertas dan barang penting lainnya.',
                  style: style(
                    primaryText,
                    16,
                    FontWeight.w400,
                    1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 127,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      if (qty != 1) {
                        setState(() {
                          qty -= 1;
                        });
                      }
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    '$qty',
                    style: style(primaryText, 16, FontWeight.w600, 0),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        qty += 1;
                      });
                    },
                    icon: Icon(Icons.add, color: qtyColor),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(primary),
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.all(18),
                  )),
              onPressed: () {
                cartController.addToCart(product);
              },
              child: Text(
                'Tambah ke Keranjang',
                style: style(white, 16, FontWeight.w600, 0),
              ),
            )
          ],
        ),
      )),
    );
  }
}
