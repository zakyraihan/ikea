import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/features/beranda/screen/beranda_screen.dart';
import 'package:ikea/model/model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CartController extends GetxController {
  final List<Products> cartItems = <Products>[].obs;
  final RxDouble totalCartPrice = 0.0.obs;

  void addToCart(Products items) {
    int existingIndex =
        cartItems.indexWhere((element) => element.id == items.id);

    if (existingIndex != -1) {
      cartItems[existingIndex].count++;
    } else {
      cartItems.add(items.copyWith(count: 1));
    }
  }

  void removeToCart(int items) {
    cartItems.removeAt(items);
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var product in cartItems) {
      total += product.price * product.count;
    }

    totalCartPrice.value = total;
    return total;
  }

  void clearCart(BuildContext context) {
    if (cartItems.isNotEmpty) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Anda Yakin",
        desc: "Ingin Menghapus Semua Barang",
        buttons: [
          DialogButton(
            color: primary,
            onPressed: () => Navigator.pop(context),
            width: 130,
            child: const Text(
              "Tidak",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            color: Colors.grey.shade400,
            onPressed: () => {
              cartItems.clear(),
              Navigator.pop(context),
            },
            width: 130,
            child: const Text(
              "oke",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ).show();
    }
  }

  void buyProduct(BuildContext context) {
    if (cartItems.isEmpty) {
      Alert(
        context: context,
        type: AlertType.error,
        title: 'Pembelian Gagal',
        desc: "Harap Masukkan Barang",
        buttons: [
          DialogButton(
            color: primary,
            onPressed: () => Navigator.pop(context),
            width: 130,
            child: const Text(
              "oke",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.success,
        title: 'Pembelian Berhasil',
        desc: "Pesanan akan di proses",
        buttons: [
          DialogButton(
            color: primary,
            onPressed: () {
              Get.to(const BerandaScreen());
              cartItems.clear();
            },
            width: 130,
            child: const Text(
              "oke",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ).show();
    }
  }
}
