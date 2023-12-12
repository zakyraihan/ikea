// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/features/carts/controller/cart_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        shape: Border(
          bottom: BorderSide(color: secondLine),
        ),
        backgroundColor: white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: primaryText,
          ),
        ),
        title: Text(
          'Keranjang',
          style: style(primaryText, 18, FontWeight.w600, 0),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/whislist-screen'),
            icon: Icon(
              Icons.favorite_border,
              color: primaryText,
              size: 26,
            ),
          )
        ],
      ),
      body: Obx(
        () => cartController.cartItems.isEmpty
            ? Center(
                child: Image.asset('assets/images/emptycart.png'),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${cartController.cartItems.length}',
                                style:
                                    style(primaryText, 14, FontWeight.w600, 0),
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
                            cartController.clearCart(context);
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
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (context, index) {
                        final product = cartController.cartItems[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
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
                                        Text(
                                          product.title,
                                          style: style(primaryText, 16,
                                              FontWeight.w600, 0),
                                        ),
                                        const Gap(6),
                                        Text(
                                          product.description,
                                          style: style(secondText, 14,
                                              FontWeight.w400, 0),
                                        ),
                                        const Gap(12),
                                        Text(
                                          'Rp${product.price}00',
                                          style: style(primaryText, 16,
                                              FontWeight.w600, 0),
                                        ),
                                        const Gap(12),
                                        Row(
                                          children: [
                                            Container(
                                              width: 72,
                                              height: 38,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: secondLine),
                                              ),
                                              child: IconButton(
                                                onPressed: () {
                                                  cartController
                                                      .removeToCart(index);
                                                  cartController.update();
                                                },
                                                icon: const Icon(
                                                  Iconsax.trash,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            const Gap(16),
                                            Container(
                                              width: 134,
                                              height: 38,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: secondLine),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      if (product.count != 1) {
                                                        setState(() {
                                                          product.count -= 1;
                                                        });
                                                      }
                                                    },
                                                    icon: const Icon(
                                                        Icons.remove),
                                                  ),
                                                  Text(
                                                    '${product.count}',
                                                    style: style(
                                                      primaryText,
                                                      14,
                                                      FontWeight.w500,
                                                      0,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        product.count += 1;
                                                        cartController
                                                            .calculateTotalPrice();
                                                      });
                                                    },
                                                    icon: Icon(Icons.add,
                                                        color: primary),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: secondLine),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              spacing: 6,
              direction: Axis.vertical,
              children: [
                Text(
                  'Total',
                  style: style(secondText, 14, FontWeight.w400, 0),
                ),
                Obx(() => Text(
                      'Rp${cartController.calculateTotalPrice().toStringAsFixed(3)}',
                      style: style(primaryText, 20, FontWeight.w700, 0),
                    )),
              ],
            ),
            GestureDetector(
              onTap: () => cartController.buyProduct(context),
              child: Container(
                width: 181,
                height: 56,
                decoration: BoxDecoration(
                  color: primary,
                ),
                child: Center(
                  child: Text(
                    'beli',
                    style: style(white, 16, FontWeight.w600, 0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
