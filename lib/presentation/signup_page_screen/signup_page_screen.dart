import 'controller/signup_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:upass_project_flutter/core/app_export.dart';
import 'package:upass_project_flutter/core/utils/validation_functions.dart';
import 'package:upass_project_flutter/widgets/custom_elevated_button.dart';
import 'package:upass_project_flutter/widgets/custom_text_form_field.dart';
import 'package:upass_project_flutter/data/models/registerAccountPost/post_register_account_post_req.dart';
import 'package:upass_project_flutter/data/models/registerAccountPost/post_register_account_post_resp.dart';

// ignore_for_file: must_be_immutable
class SignupPageScreen extends GetWidget<SignupPageController> {
  SignupPageScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(height: 25.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(children: [
                        _buildSignupPageImages(),
                        SizedBox(height: 25.v),
                        _buildEmail(),
                        SizedBox(height: 23.v),
                        _buildPassword(),
                        SizedBox(height: 10.v),
                        SizedBox(
                            height: 480.v,
                            width: double.maxFinite,
                            child:
                                Stack(alignment: Alignment.topRight, children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgEllipse3373x178,
                                  height: 373.v,
                                  width: 178.h,
                                  alignment: Alignment.bottomLeft),
                              CustomImageView(
                                  imagePath: ImageConstant.imgEllipse3373x213,
                                  height: 373.v,
                                  width: 213.h,
                                  alignment: Alignment.topRight),
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapTxtLogininstead();
                                      },
                                      child: Padding(
                                          padding: EdgeInsets.only(top: 169.v),
                                          child: RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text: "lbl_login2".tr,
                                                    style: theme
                                                        .textTheme.titleLarge!
                                                        .copyWith(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline)),
                                                TextSpan(text: " "),
                                                TextSpan(
                                                    text: "lbl_instead".tr,
                                                    style: CustomTextStyles
                                                        .titleLargeRegular)
                                              ]),
                                              textAlign: TextAlign.left)))),
                              _buildSignupButton(),
                              _buildConfirmPassword()
                            ]))
                      ])))
                    ])))));
  }

  /// Section Widget
  Widget _buildSignupPageImages() {
    return Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
            height: 412.v,
            width: 376.h,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgImg20231001Wa0001,
                  height: 73.v,
                  width: 160.h,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 18.h),
                  onTap: () {
                    onTapImgIMGWA();
                  }),
              CustomImageView(
                  imagePath: ImageConstant.imgVector1,
                  height: 144.v,
                  width: 363.h,
                  alignment: Alignment.bottomCenter),
              CustomImageView(
                  imagePath: ImageConstant.imgSignuppageimage334x363,
                  height: 334.v,
                  width: 363.h,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 30.v))
            ])));
  }

  /// Section Widget
  Widget _buildEmail() {
    return Padding(
        padding: EdgeInsets.only(left: 50.h, right: 51.h),
        child: CustomTextFormField(
            controller: controller.emailController,
            hintText: "lbl_email".tr,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            },
            contentPadding: EdgeInsets.symmetric(horizontal: 11.h)));
  }

  /// Section Widget
  Widget _buildPassword() {
    return Padding(
        padding: EdgeInsets.only(left: 49.h, right: 51.h),
        child: CustomTextFormField(
            controller: controller.passwordController,
            hintText: "lbl_password".tr,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 11.h)));
  }

  /// Section Widget
  Widget _buildSignupButton() {
    return CustomElevatedButton(
        width: 214.h,
        text: "lbl_sign_up".tr,
        margin: EdgeInsets.only(top: 94.v),
        buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
        onPressed: () {
          signup_api();
        },
        alignment: Alignment.topCenter);
  }

  /// Section Widget
  Widget _buildConfirmPassword() {
    return Padding(
        padding: EdgeInsets.only(top: 15.v),
        child: CustomTextFormField(
            width: 288.h,
            controller: controller.confirmPasswordController,
            hintText: "msg_confirm_password".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            alignment: Alignment.topCenter,
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 11.h)));
  }

  /// Navigates to the landingPageScreen when the action is triggered.
  onTapImgIMGWA() {
    Get.toNamed(
      AppRoutes.landingPageScreen,
    );
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapTxtLogininstead() {
    Get.toNamed(
      AppRoutes.loginPageScreen,
    );
  }

  /// calls the [https://gleedevapi.kodowo.com/api/Account/Register] API
  ///
  /// validates the form input fields and executes the API if all the fields are valid
  /// It has [PostRegisterAccountPostReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onSignup_apiSuccess()` function.
  /// If the call fails, the function calls the `_onSignup_apiError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  Future<void> signup_api() async {
    if (_formKey.currentState!.validate()) {
      PostRegisterAccountPostReq postRegisterAccountPostReq =
          PostRegisterAccountPostReq(
        email: controller.emailController.text,
        password: controller.passwordController.text,
        confirmPassword: controller.confirmPasswordController.text,
      );
      try {
        await controller.callRegisterAccountPost(
          postRegisterAccountPostReq.toJson(),
        );
        _onSignup_apiSuccess();
      } on PostRegisterAccountPostResp {
        _onSignup_apiError();
      } on NoInternetException catch (e) {
        Get.rawSnackbar(message: e.toString());
      } catch (e) {
        //TODO: Handle generic errors
      }
    }
  }

  /// Displays an alert dialog when the action is triggered.
  /// This function is typically called in response to a API call. It retrieves
  /// the `Message` data from the `PostRegisterAccountPostResp`
  /// object in the `controller` using the `Message` field.
  void _onSignup_apiSuccess() {
    Get.defaultDialog(
        onConfirm: () => Get.back(),
        title: 'Signup Successful!',
        middleText:
            controller.postRegisterAccountPostResp.message.toString() ?? '');
  }

  /// Displays an alert dialog when the action is triggered.
  /// This function is typically called in response to a API call. It retrieves
  /// the `Message` data from the `PostRegisterAccountPostResp`
  /// object in the `controller` using the `Message` field.
  void _onSignup_apiError() {
    Get.defaultDialog(
        onConfirm: () => Get.back(),
        title: 'Error!',
        middleText:
            controller.postRegisterAccountPostResp.message.toString() ?? '');
  }
}
