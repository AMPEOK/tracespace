import 'package:upass_project_flutter/presentation/landing_page_screen/landing_page_screen.dart';
import 'package:upass_project_flutter/presentation/landing_page_screen/binding/landing_page_binding.dart';
import 'package:upass_project_flutter/presentation/login_page_screen/login_page_screen.dart';
import 'package:upass_project_flutter/presentation/login_page_screen/binding/login_page_binding.dart';
import 'package:upass_project_flutter/presentation/signup_page_screen/signup_page_screen.dart';
import 'package:upass_project_flutter/presentation/signup_page_screen/binding/signup_page_binding.dart';
import 'package:upass_project_flutter/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:upass_project_flutter/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String landingPageScreen = '/landing_page_screen';

  static const String loginPageScreen = '/login_page_screen';

  static const String signupPageScreen = '/signup_page_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: landingPageScreen,
      page: () => LandingPageScreen(),
      bindings: [
        LandingPageBinding(),
      ],
    ),
    GetPage(
      name: loginPageScreen,
      page: () => LoginPageScreen(),
      bindings: [
        LoginPageBinding(),
      ],
    ),
    GetPage(
      name: signupPageScreen,
      page: () => SignupPageScreen(),
      bindings: [
        SignupPageBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => LandingPageScreen(),
      bindings: [
        LandingPageBinding(),
      ],
    )
  ];
}
