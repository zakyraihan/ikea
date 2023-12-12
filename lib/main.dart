import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikea/controller/mainscreen_controller.dart';
import 'package:ikea/features/carts/controller/cart_controller.dart';
import 'package:ikea/features/whislist/controller/whislist_controller.dart';
import 'package:ikea/routes/route_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RoutePage().routes,
      initialRoute: '/main-screen',
      initialBinding: BindingsBuilder(() {
        Get.put(CartController());
        Get.put(WhislistController());
      }),
    );
  }
}
