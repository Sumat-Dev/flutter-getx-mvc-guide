import 'package:flutter_getx_mvc_guide/feature/product/bindings/product_binding.dart';
import 'package:flutter_getx_mvc_guide/feature/product/views/product_screen.dart';
import 'package:get/get.dart';


part 'app_routes.dart';

class AppPages {
  static const initial = Routes.PRODUCT;

  static final routes = [
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductScreen(),
      binding: ProductBinding(),
    ),
    // ...
  ];
}
