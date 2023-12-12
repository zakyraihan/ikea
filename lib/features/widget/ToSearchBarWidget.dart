import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/features/search/screen/search_screen.dart';

class ToSearchBarWidget extends StatelessWidget {
  const ToSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(const SearchPage()),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: secondLine),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: primaryText,
            ),
            const SizedBox(width: 20),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Cari Barang Impianmu...',
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: secondText,
                    fontWeight: FontWeight.w400,
                  ),
                  speed: const Duration(milliseconds: 50),
                  cursor: '',
                ),
              ],
              repeatForever: true,
              isRepeatingAnimation: true,
              pause: const Duration(milliseconds: 1000),
            )
          ],
        ),
      ),
    );
  }
}
