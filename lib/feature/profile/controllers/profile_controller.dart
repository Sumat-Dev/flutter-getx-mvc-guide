import 'package:flutter_getx_mvc_guide/core/constants/app_constants.dart';
import 'package:flutter_getx_mvc_guide/core/errors/error_handler.dart';
import 'package:flutter_getx_mvc_guide/core/services/api_services.dart';
import 'package:flutter_getx_mvc_guide/feature/profile/models/user_model.dart';
import 'package:get/get.dart';

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
