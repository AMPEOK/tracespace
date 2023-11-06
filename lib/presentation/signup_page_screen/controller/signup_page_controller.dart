import 'package:upass_project_flutter/core/app_export.dart';
import 'package:upass_project_flutter/presentation/signup_page_screen/models/signup_page_model.dart';
import 'package:flutter/material.dart';
import 'package:upass_project_flutter/data/models/registerAccountPost/post_register_account_post_resp.dart';
import 'package:upass_project_flutter/data/apiClient/api_client.dart';

/// A controller class for the SignupPageScreen.
///
/// This class manages the state of the SignupPageScreen, including the
/// current signupPageModelObj
class SignupPageController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  Rx<SignupPageModel> signupPageModelObj = SignupPageModel().obs;

  PostRegisterAccountPostResp postRegisterAccountPostResp =
      PostRegisterAccountPostResp();

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  /// Calls the https://gleedevapi.kodowo.com/api/Account/Register API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callRegisterAccountPost(Map req) async {
    try {
      postRegisterAccountPostResp =
          await Get.find<ApiClient>().registerAccountPost(
        headers: {
          'Content-type': 'application/json',
        },
        requestData: req,
      );
      _handleRegisterAccountPostSuccess();
    } on PostRegisterAccountPostResp catch (e) {
      postRegisterAccountPostResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  void _handleRegisterAccountPostSuccess() {}
}
