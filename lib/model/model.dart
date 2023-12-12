import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ikea/color/constant_color.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  List<ProductElement> products;
  int total;
  int skip;
  int limit;

  Product({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class ProductElement {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  ProductElement({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

class Products {
  final String id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String imageAsset;
  final List imageDetail;
  int count;

  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageAsset,
    required this.imageDetail,
    required this.count,
  });

  // Add the copyWith method inside the Products class
  Products copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? imageAsset,
    int? count,
  }) {
    return Products(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      rating: rating,
      imageAsset: imageAsset ?? this.imageAsset,
      imageDetail: imageDetail,
      count: count ?? this.count,
    );
  }

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      imageAsset: json['imageAsset'],
      imageDetail: json['imageDetail'] != null
          ? List<String>.from(json['imageDetail'])
          : [],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'rating': rating,
      'imageAsset': imageAsset,
      'imageDetail': imageDetail,
      'count': count,
    };
  }

  toMap() {}
}

List<Products> productsFromJson(String jsonString) {
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => Products.fromJson(json)).toList();
}

String productsToJson(List<Products> products) {
  final List<Map<String, dynamic>> jsonList =
      products.map((product) => product.toJson()).toList();
  return json.encode(jsonList);
}

List<Products> productsList = [
  Products(
    id: '1',
    title: 'pengait',
    description: 'Pengait dengan plastik isap ...',
    price: 99.90,
    rating: 4.5,
    imageAsset: 'assets/images/Rectangle 15.png',
    imageDetail: [],
    count: 1,
  ),
  Products(
    id: '2',
    title: 'ALEX/LAGKAPTEN',
    description: 'Meja, hijau muda/putih, 120x60 cm',
    price: 140.00,
    rating: 4.5,
    imageAsset: 'assets/images/Rectangle 16.png',
    imageDetail: [],
    count: 1,
  ),
  Products(
    id: '3',
    title: 'FARDAL/PAX',
    description: 'Kombinasi lemari pakaian, putih/hig...',
    price: 200.400,
    rating: 4.5,
    imageAsset: 'assets/images/Rectangle 17.png',
    imageDetail: [
      'assets/images/Rectangle 16.png',
      'assets/images/lemari2.png',
      'assets/images/lemari3.png',
      'assets/images/lemari4.png',
      'assets/images/lemari5.png',
    ],
    count: 1,
  ),
  Products(
    id: '4',
    title: 'ALEX',
    description: 'Unit laci, abu-abu toska, 36x70 cm',
    price: 1.350,
    rating: 4.5,
    imageAsset: 'assets/images/banker.png',
    imageDetail: [],
    count: 1,
  ),
  Products(
    id: '5',
    title: 'MILLBERGET',
    description: 'Kursi putar, murum hitam',
    price: 1.799,
    rating: 4.5,
    imageAsset: 'assets/images/kursi.png',
    imageDetail: [],
    count: 1,
  ),
  Products(
    id: '6',
    title: 'SONGESAND',
    description: 'Rngk tmpt tdr dg 2 ktk...',
    price: 3.499,
    rating: 4.5,
    imageAsset: 'assets/images/ranjang.png',
    imageDetail: [],
    count: 1,
  ),
  Products(
    id: '7',
    title: 'HEKTAR',
    description: 'Lampu lantai, abu-abu tua',
    price: 1.299,
    rating: 4.5,
    imageAsset: 'assets/images/lampu.png',
    imageDetail: [],
    count: 1,
  ),
];

List<Widget> koleksiList = [
  Container(
    width: 175,
    height: 250,
    padding: const EdgeInsets.all(5),
    child: Container(
      width: 240,
      color: teal,
      child: Column(
        children: [
          Image.asset('assets/images/koleksi2.png'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BLÅVINGAD',
                  style: style(white, 16, FontWeight.w600, 0),
                ),
                const SizedBox(height: 12),
                Text(
                  'Koleksi yang terinspirasi dari lautan untuk menciptakan ...',
                  style: style(white, 16, FontWeight.w600, 0),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  ),
  Container(
    width: 175,
    height: 250,
    padding: const EdgeInsets.all(5),
    child: Container(
      width: 240,
      color: brown,
      child: Column(
        children: [
          Image.asset('assets/images/koleksi1.png'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VINTERFINT',
                  style: style(white, 16, FontWeight.w600, 0),
                ),
                const SizedBox(height: 12),
                Text(
                  'Koleksi VINTERFINT hadir dengan warna dan pola indah ...',
                  style: style(white, 16, FontWeight.w600, 0),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  ),
];

List<Widget> inspirasiSemua = [
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17),
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 170,
              height: 170,
              child: Column(
                children: [
                  Image.asset('assets/images/hunian.png'),
                  const Gap(16),
                  Text(
                    'Hunian compact yang nyaman',
                    style: style(
                      primaryText,
                      16,
                      FontWeight.w600,
                      0,
                    ),
                  )
                ],
              ),
            ),
            const Gap(16),
            SizedBox(
              width: 170,
              height: 170,
              child: Column(
                children: [
                  Image.asset('assets/images/lakukan.png'),
                  const Gap(16),
                  Text(
                    'Lakukan 5 hal ini agar sepatumu bebas ...',
                    style: style(
                      primaryText,
                      16,
                      FontWeight.w600,
                      0,
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ),
  ),
  const Gap(24),
  SizedBox(
    width: 355,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/kamar.png'),
        const Gap(16),
        Text(
          'Hadirkan nuasa elegant dan fancy kedalam kamar tidur anda',
          style: style(
            primaryText,
            16,
            FontWeight.w600,
            0,
          ),
        ),
        const Gap(24),
        Row(
          children: [
            SizedBox(
              width: 170,
              height: 170,
              child: Column(
                children: [
                  Image.asset('assets/images/rumasehat.png'),
                  const Gap(16),
                  Text(
                    'Rumah lebih sehat dengan set tempat ...',
                    style: style(
                      primaryText,
                      16,
                      FontWeight.w600,
                      0,
                    ),
                  )
                ],
              ),
            ),
            const Gap(14),
            SizedBox(
              width: 165,
              height: 165,
              child: Column(
                children: [
                  Image.asset('assets/images/kmranak.png'),
                  const Gap(16),
                  Text(
                    'Membuat kamar anak rapi jadi lebih mudah',
                    style: style(
                      primaryText,
                      16,
                      FontWeight.w600,
                      0,
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ),
  )
];

final List<String> kategory = [
  'assets/images/Group 4.png',
  'assets/images/ruangkerja.png',
  'assets/images/Group 5.png',
  'assets/images/Group 2.png',
  'assets/images/tekstil.png',
  'assets/images/Group 3.png',
];

List star = [
  const Icon(Icons.star, color: Colors.yellow),
  const Icon(Icons.star, color: Colors.yellow),
  const Icon(Icons.star, color: Colors.yellow),
  const Icon(Icons.star, color: Colors.yellow),
  const Icon(Icons.star, color: Colors.yellow),
];
