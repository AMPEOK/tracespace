import '../controller/landing_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LandingPageScreen.
///
/// This class ensures that the LandingPageController is created when the
/// LandingPageScreen is first loaded.
class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LandingPageController());
  }
}
