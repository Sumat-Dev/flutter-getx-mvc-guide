import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_guide/core/common/loading_Indicator.dart';
import 'package:flutter_getx_mvc_guide/feature/profile/controllers/profile_controller.dart';
import 'package:flutter_getx_mvc_guide/feature/profile/widgets/user_profile_widget.dart';
import 'package:get/get.dart';

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
