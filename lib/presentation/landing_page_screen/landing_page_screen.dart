import 'controller/landing_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:upass_project_flutter/core/app_export.dart';
import 'package:upass_project_flutter/core/utils/validation_functions.dart';
import 'package:upass_project_flutter/widgets/custom_outlined_button.dart';
import 'package:upass_project_flutter/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LandingPageScreen extends GetWidget<LandingPageController> {
  LandingPageScreen({Key? key}) : super(key: key);

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
                        CustomImageView(
                            imagePath: ImageConstant.imgImg20231001Wa0001,
                            height: 73.v,
                            width: 160.h,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 18.h)),
                        SizedBox(height: 42.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                height: 261.v,
                                width: 304.h,
                                margin: EdgeInsets.only(left: 31.h),
                                child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                              height: 261.v,
                                              width: 281.h,
                                              decoration: BoxDecoration(
                                                  color: theme.colorScheme
                                                      .onPrimaryContainer,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          41.h),
                                                  border: Border.all(
                                                      color: theme.colorScheme
                                                          .onPrimaryContainer
                                                          .withOpacity(1),
                                                      width: 2.h)))),
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgLandingpage,
                                          height: 261.v,
                                          width: 283.h,
                                          radius: BorderRadius.circular(51.h),
                                          alignment: Alignment.centerLeft)
                                    ]))),
                        SizedBox(height: 72.v),
                        GestureDetector(
                            onTap: () {
                              onTapTxtJoinusnow();
                            },
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "lbl_join".tr,
                                      style: theme.textTheme.displaySmall),
                                  TextSpan(
                                      text: "lbl_us_now".tr,
                                      style: theme.textTheme.displaySmall)
                                ]),
                                textAlign: TextAlign.left)),
                        SizedBox(height: 26.v),
                        CustomTextFormField(
                            width: 244.h,
                            controller: controller.confirmationController,
                            hintText: "msg_already_have_an".tr,
                            hintStyle: CustomTextStyles
                                .titleLargeAkayaTelivigalaBlack900,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_password".tr;
                              }
                              return null;
                            },
                            obscureText: true),
                        SizedBox(height: 16.v),
                        CustomOutlinedButton(
                            width: 178.h,
                            text: "lbl_login".tr,
                            onPressed: () {
                              onTapLOGIN();
                            }),
                        SizedBox(
                            width: double.maxFinite,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgEllipse3,
                                      height: 373.v,
                                      width: 98.h,
                                      margin: EdgeInsets.only(top: 115.v)),
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgEllipse3373x242,
                                      height: 373.v,
                                      width: 242.h,
                                      margin: EdgeInsets.only(bottom: 115.v))
                                ]))
                      ])))
                    ])))));
  }

  /// Navigates to the signupPageScreen when the action is triggered.
  onTapTxtJoinusnow() {
    Get.toNamed(
      AppRoutes.signupPageScreen,
    );
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapLOGIN() {
    Get.toNamed(
      AppRoutes.loginPageScreen,
    );
  }
}
