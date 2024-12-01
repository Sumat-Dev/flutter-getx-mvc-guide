# Flutter GetX MVC Architecture Guide

## 📖 Table of Contents
- [Introduction](#introduction)
- [Architectural Pattern](#architectural-pattern)
- [Project Structure](#project-structure)
- [Key Components](#key-components)
- [Getting Started](#getting-started)
- [Packages](#packages)

## 🚀 Introduction

This project implements a robust Model-View-Controller (MVC) architectural pattern using GetX for state management in Flutter. Our goal is to create a scalable, maintainable, and efficient mobile application architecture

## 🏗 Architectural Pattern

### MVC Pattern Overview

The Model-View-Controller (MVC) pattern divides the application into three core components:

| Component | Responsibility | Description |
|-----------|----------------|-------------|
| **Model** | Data & Business Logic | - Represents application data<br>- Manages data transformations<br>- Implements business rules |
| **View** | User Interface | - Displays data to the user<br>- Captures user interactions<br>- Renders widgets |
| **Controller** | Intermediary & Logic | - Handles user input<br>- Coordinates between Model and View<br>- Manages application state |

## 📂 Project Structure
```
lib/
│
├── config/
│   ├── routes/
│   └── themes/
│
├── core/
│   ├── common/
│   ├── constants/
│   ├── error/
│   ├── services/
│   └── utils/
│
├── features/
│   └── profile/
│       ├── bindings/
│       ├── controllers/
│       ├── models/
│       └── views/
│
└── main.dart
```

## 🧩 Key Components

### 1. Model
```dart
class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final int stock;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.stock,
  });
}
```

### 2. Controller
```dart
class ProductController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  final RxList<ProductModel> _productList = <ProductModel>[].obs;
  List<ProductModel> get productList => _productList;

  Future<void> getProducts() async {
    //...
  }
}

```

### 3. View
```dart
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
}
```

## 🛠️ Getting Started

### Installation

1. Clone the repository
```bash
git clone https://github.com/Sumat-Dev/flutter-getx-mvc-guide.git
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the application
```bash
flutter run
```

## 📦 Packages
- `get: ^4.6.6` (State Management)

## 👨‍💻 Author
**Sumat Dev**
- GitHub: [@Sumat-Dev](https://github.com/Sumat-Dev)

---

**Happy Coding! 💻✨**
