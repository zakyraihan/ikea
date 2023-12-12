import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/model/model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WhislistController extends GetxController {
  final List<Products> whislistItems = <Products>[].obs;

  void addToWhislist(Products items) {
    int existingIndex =
        whislistItems.indexWhere((element) => element.id == items.id);

    if (existingIndex != -1) {
      // If the item already exists, update the count
      whislistItems[existingIndex].count++;
    } else {
      // If the item doesn't exist, add it to the cart
      whislistItems.add(items.copyWith(count: 1));
    }
  }

  void removeToWhislist(int items) {
    whislistItems.removeAt(items);
  }

  void clearWhislist(BuildContext context) {
    if (whislistItems.isNotEmpty) {
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
              whislistItems.clear(),
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
}
