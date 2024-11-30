# Flutter GetX MVC Architecture Guide

## 📖 Table of Contents
- [Introduction](#introduction)
- [Architectural Pattern](#architectural-pattern)
- [Project Structure](#project-structure)
- [Key Components](#key-components)
- [Getting Started](#getting-started)

## 🚀 Overview

This project implements a robust Model-View-Controller (MVC) architectural pattern using GetX for state management in Flutter. Our goal is to create a scalable, maintainable, and efficient mobile application architecture.

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
flutter_getx_mvc_guide/
│
├── lib/
│   ├── core/           # Core application components
│   ├── config/         # Configuration and dependency injection
│   ├── feature/        # Feature-specific modules
│   └── main.dart       
│
└── assets/             # Static resources
```

## 🧩 Key Components

### 1. Model
```dart
class UserModel {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl
  });
}
```

### 2. Controller
```dart
class ProfileController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  final Rx<UserModel?> _user = Rx<UserModel?>(null);
  UserModel? get user => _user.value;

  Future<void> fetchUserData() async {
    try {
      final user = await _apiServices.get(ApiPath.profile);
      _user.value = user as UserModel;
    } catch (e) {
      ErrorHandler.handleUnknownError(Get.context!, e);
    }
  }
}

```

### 3. View
```dart
class UserProfileScreen extends GetView<ProfileController> {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final user = controller.user;
        return user != null
            ? UserProfileWidget(user: user)
            : const LoadingIndicator();
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
- `http: ^1.2.2` (HTTP Requests)
- `shared_preferences: ^2.3.3`

## 📝 License
This project is [MIT](https://choosealicense.com/licenses/mit/) licensed.

## 👨‍💻 Author
**Sumat Dev**
- GitHub: [@Sumat-Dev](https://github.com/Sumat-Dev)

---

**Happy Coding! 💻✨**
