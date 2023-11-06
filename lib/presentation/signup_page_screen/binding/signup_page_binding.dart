import '../controller/signup_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SignupPageScreen.
///
/// This class ensures that the SignupPageController is created when the
/// SignupPageScreen is first loaded.
class SignupPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupPageController());
  }
}
