import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ikea/color/constant_color.dart';
import 'package:ikea/model/model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Products> display_product = List.of(productsList);

  void filterProduct(String value) {
    setState(() {
      display_product = productsList
          .where(
              (element) => element.title.toLowerCase().toUpperCase().contains(
                    value.toLowerCase().toUpperCase(),
                  ))
          .toList();
    });
  }

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
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Image.asset('assets/images/logo.png'),
          ),
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
                Icon(
                  Icons.trolley,
                  color: primaryText,
                  size: 26,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  onChanged: (value) => filterProduct(value),
                  autofocus: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Cari barang impianmu',
                    hintStyle: style(secondText, 16, FontWeight.normal, 3.2),
                    suffixIcon: const Icon(Icons.clear),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: display_product.isEmpty
                ? const Center(
                    child: Text('Barang Tidak Tersedia'),
                  )
                : ListView.builder(
                    itemCount: display_product.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.toNamed('/product-detail'),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 7,
                          ),
                          title: Text(display_product[index].title),
                          leading:
                              Image.asset(display_product[index].imageAsset),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
