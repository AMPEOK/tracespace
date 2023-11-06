import 'package:upass_project_flutter/core/app_export.dart';
import 'package:upass_project_flutter/presentation/landing_page_screen/models/landing_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LandingPageScreen.
///
/// This class manages the state of the LandingPageScreen, including the
/// current landingPageModelObj
class LandingPageController extends GetxController {
  TextEditingController confirmationController = TextEditingController();

  Rx<LandingPageModel> landingPageModelObj = LandingPageModel().obs;

  @override
  void onClose() {
    super.onClose();
    confirmationController.dispose();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.signupPageScreen,
      );
    });
  }
}
