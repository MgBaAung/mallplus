import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/auth/login/controller/login_controller.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/controller/auth_controller.dart';
import 'package:mall_plus_new_customer_app/pages/auth/otp/controller/otp_controller.dart';

class OtpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpControllerImpl());
    Get.lazyPut<AuthController>(() => AuthControllerImpl());
  }
}
