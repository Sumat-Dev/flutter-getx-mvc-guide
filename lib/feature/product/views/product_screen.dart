import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_guide/core/common/loading_Indicator.dart';
import 'package:flutter_getx_mvc_guide/feature/product/controllers/product_controller.dart';
import 'package:flutter_getx_mvc_guide/feature/product/models/product_model.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();

    return Scaffold(
      body: Obx(() {
        if (productController.productList.isEmpty) {
          return const LoadingIndicator();
        }

        if (productController.productList.isNotEmpty) {
          return _buildProductWidget();
        }

        return const SizedBox.shrink();
      }),
    );
  }

  Widget _buildProductWidget() {
    final ProductController productController = Get.find();
    return ListView.builder(
      itemCount: productController.productList.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final product = productController.productList[index];
        return _buildProductCardWidget(product);
      },
    );
  }

  Widget _buildProductCardWidget(ProductModel product) {
    return Card(
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(8),
              ),
              child: Image.network(
                product.imageUrl,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Price: \$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Stock: ${product.stock} available',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
