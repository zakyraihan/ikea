import 'package:get/route_manager.dart';
import 'package:ikea/features/carts/screen/cart_screen.dart';
import 'package:ikea/features/inspirasi/screen/inspiration_screen.dart';
import 'package:ikea/features/product_detail/screen/product_detail_screen.dart';
import 'package:ikea/features/whislist/screen/whislist_screen.dart';
import 'package:ikea/main_screen.dart';

class RouteName {
  static const mainScreen = '/main-screen';
  static const productDetail = '/product-detail';
  static const cartScreen = '/cart';
  static const inspirationScreen = '/inspiration-screen';
  static const whislistScreen = '/whislist-screen';
}

class RoutePage {
  List<GetPage<dynamic>> routes = [
    GetPage(
      name: RouteName.mainScreen,
      page: () => MainScreen(),
    ),
    GetPage(
      name: RouteName.productDetail,
      page: () => const ProductDetail(),
    ),
    GetPage(
      name: RouteName.cartScreen,
      page: () => CartScreen(),
    ),
    GetPage(
      name: RouteName.inspirationScreen,
      page: () => const InspirationScreen(),
    ),
    GetPage(
      name: RouteName.whislistScreen,
      page: () => WhislistScreen(),
    )
  ];
}
