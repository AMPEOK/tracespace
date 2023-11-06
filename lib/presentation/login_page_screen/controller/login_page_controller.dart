import 'package:upass_project_flutter/core/app_export.dart';
import 'package:upass_project_flutter/presentation/login_page_screen/models/login_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LoginPageScreen.
///
/// This class manages the state of the LoginPageScreen, including the
/// current loginPageModelObj
class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LoginPageModel> loginPageModelObj = LoginPageModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
