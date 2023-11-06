import 'controller/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:upass_project_flutter/core/app_export.dart';
import 'package:upass_project_flutter/core/utils/validation_functions.dart';
import 'package:upass_project_flutter/widgets/custom_elevated_button.dart';
import 'package:upass_project_flutter/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginPageScreen extends GetWidget<LoginPageController> {
  LoginPageScreen({Key? key}) : super(key: key);

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
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgImg20231001Wa0001,
                                height: 73.v,
                                width: 160.h,
                                margin: EdgeInsets.only(left: 18.h),
                                onTap: () {
                                  onTapImgIMGWA();
                                }),
                            SizedBox(height: 26.v),
                            SizedBox(
                                height: 512.v,
                                width: 339.h,
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgEllipse2,
                                          height: 373.v,
                                          width: 160.h,
                                          alignment: Alignment.bottomLeft,
                                          margin:
                                              EdgeInsets.only(bottom: 13.v)),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 210.v, right: 57.h),
                                              child: Text("lbl_login_now".tr,
                                                  style: theme.textTheme
                                                      .headlineLarge))),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                              height: 180.adaptSize,
                                              width: 180.adaptSize,
                                              margin:
                                                  EdgeInsets.only(right: 54.h),
                                              decoration: AppDecoration
                                                  .outlinePrimary
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder20),
                                              child: CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgSignuppageimage,
                                                  height: 175.adaptSize,
                                                  width: 175.adaptSize,
                                                  radius: BorderRadius.circular(
                                                      17.h),
                                                  alignment:
                                                      Alignment.center))),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: GestureDetector(
                                              onTap: () {
                                                onTapComponentTwo();
                                              },
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 58.h),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        2.v),
                                                            child: Text(
                                                                "lbl_create_an"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .titleLargePrimaryRegular)),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 8.h,
                                                                    top: 2.v),
                                                            child: Text(
                                                                "lbl_account"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .titleLargePrimary
                                                                    .copyWith(
                                                                        decoration:
                                                                            TextDecoration.underline)))
                                                      ])))),
                                      CustomElevatedButton(
                                          width: 214.h,
                                          text: "lbl_login".tr,
                                          margin: EdgeInsets.only(
                                              right: 37.h, bottom: 47.v),
                                          alignment: Alignment.bottomRight),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 207.v),
                                          child: CustomTextFormField(
                                              width: 288.h,
                                              controller:
                                                  controller.emailController,
                                              hintText: "lbl_email".tr,
                                              textInputType:
                                                  TextInputType.emailAddress,
                                              alignment: Alignment.bottomRight,
                                              validator: (value) {
                                                if (value == null ||
                                                    (!isValidEmail(value,
                                                        isRequired: true))) {
                                                  return "err_msg_please_enter_valid_email"
                                                      .tr;
                                                }
                                                return null;
                                              },
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 11.h))),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 129.v),
                                          child: CustomTextFormField(
                                              width: 288.h,
                                              controller:
                                                  controller.passwordController,
                                              hintText: "lbl_password".tr,
                                              textInputAction:
                                                  TextInputAction.done,
                                              textInputType:
                                                  TextInputType.visiblePassword,
                                              alignment: Alignment.bottomRight,
                                              validator: (value) {
                                                if (value == null ||
                                                    (!isValidPassword(value,
                                                        isRequired: true))) {
                                                  return "err_msg_please_enter_valid_password"
                                                      .tr;
                                                }
                                                return null;
                                              },
                                              obscureText: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 11.h)))
                                    ])),
                            SizedBox(height: 18.v),
                            _buildEleven()
                          ])))
                    ])))));
  }

  /// Section Widget
  Widget _buildEleven() {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 76.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgDownload2,
                      height: 55.adaptSize,
                      width: 55.adaptSize,
                      radius: BorderRadius.circular(27.h),
                      margin: EdgeInsets.only(bottom: 349.v)),
                  SizedBox(
                      height: 404.v,
                      width: 160.h,
                      child: Stack(alignment: Alignment.topLeft, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgEllipse1,
                            height: 373.v,
                            width: 160.h,
                            alignment: Alignment.bottomCenter),
                        CustomImageView(
                            imagePath: ImageConstant.imgDownload1,
                            height: 55.adaptSize,
                            width: 55.adaptSize,
                            radius: BorderRadius.circular(27.h),
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 29.h))
                      ]))
                ])));
  }

  /// Navigates to the landingPageScreen when the action is triggered.
  onTapImgIMGWA() {
    Get.toNamed(
      AppRoutes.landingPageScreen,
    );
  }

  /// Navigates to the signupPageScreen when the action is triggered.
  onTapComponentTwo() {
    Get.toNamed(
      AppRoutes.signupPageScreen,
    );
  }
}
