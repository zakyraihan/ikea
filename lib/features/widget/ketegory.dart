import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/model/model.dart';

class Kategory extends StatelessWidget {
  const Kategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      children: kategory.map((e) {
        return GestureDetector(
          onTap: () => Get.snackbar(
            'Ikea',
            'Halaman Tidak Tersedia',
            backgroundColor: primary,
            colorText: white,
            isDismissible: true,
            dismissDirection: DismissDirection.startToEnd,
            icon: Image.asset(
              'assets/images/logo.png',
            ),
            showProgressIndicator: true,
            progressIndicatorBackgroundColor: primary,
            borderRadius: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(e),
              const SizedBox(height: 6),
            ],
          ),
        );
      }).toList(),
    );
  }
}
