import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/controller/auth_controller.dart';
import 'package:mall_plus_new_customer_app/pages/auth/login/controller/login_controller.dart';
import 'package:mall_plus_new_customer_app/pages/auth/register/controller/register_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/controllers/main_controller.dart';
import 'package:mall_plus_new_customer_app/services/auth_service.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterControllerImpl());

    Get.lazyPut<AuthController>(() => AuthControllerImpl());
  }
}
