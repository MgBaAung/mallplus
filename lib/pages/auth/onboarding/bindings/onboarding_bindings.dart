import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/auth/login/view/screen/login_screen.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/controller/auth_controller.dart';
import 'package:mall_plus_new_customer_app/pages/auth/login/controller/login_controller.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/controller/notification_controller.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/view/widget/notification_dialog.dart';
import 'package:mall_plus_new_customer_app/pages/main/controllers/main_controller.dart';

class OnBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthControllerImpl());
    Get.putAsync<NotificationPermissionController>(
        () async => NotificationPermissionControllerImpl());
    Get.lazyPut<LoginController>(() =>LoginControllerImpl() );
  }
}
