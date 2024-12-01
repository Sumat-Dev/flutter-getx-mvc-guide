import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getx_mvc_guide/core/services/api_services.dart';
import 'package:flutter_getx_mvc_guide/feature/product/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  final RxList<ProductModel> _productList = <ProductModel>[].obs;

  List<ProductModel> get productList => _productList;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  Future<void> getProducts() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      final String response =
          await rootBundle.loadString('assets/products.json');
      final List<dynamic> data = json.decode(response);
      final List<ProductModel> products =
          data.map((item) => ProductModel.fromJson(item)).toList();
      _productList.value = products;
      return;
    } catch (e) {
      debugPrint("Error fetching products: ${e.toString()}");
    }
  }
}
