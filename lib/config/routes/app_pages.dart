import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_guide/config/bindings/profile_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const Scaffold(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const Scaffold(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const Scaffold(),
      binding: ProfileBinding(),
    ),
  ];
}
