import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/model/model.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: productsList.map((e) {
        return Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () =>
                Get.toNamed('/product-detail', arguments: {'e': e, 'a': e}),
            child: SizedBox(
              width: 200,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(e.imageAsset, height: 150),
                      Text(
                        e.title,
                        style: style(primaryText, 16, FontWeight.w600, 0),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        e.description,
                        overflow: TextOverflow.ellipsis,
                        style: style(secondText, 14, FontWeight.w400, 0),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Rp${e.price}00',
                        style: style(primaryText, 16, FontWeight.w600, 0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        height: 270,
        viewportFraction: 0.5,
      ),
    );
  }
}
