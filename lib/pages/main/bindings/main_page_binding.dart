import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/auth/login/controller/login_controller.dart';

import 'package:mall_plus_new_customer_app/pages/checkout/controllers/cart_controller.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/pages/delivery_address/controllers/delivery_address_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/controllers/main_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/cuisine/controller/cuisine_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/home/controller/home_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/order/controller/order_history_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/resturant/controller/resturant_controller.dart';

import '../../auth/onboarding/controller/auth_controller.dart';
import '../../auth/onboarding/controller/notification_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<MainController>(() => MainControllerImpl());
    Get.put<MainController>(MainControllerImpl(), permanent: true);
    Get.lazyPut<AuthController>(() => AuthControllerImpl());
    // Get.lazyPut<NotificationPermissionController>(()=> NotificationPermissionControllerImpl());
    Get.putAsync<NotificationPermissionController>(
        () async => NotificationPermissionControllerImpl());
    Get.lazyPut<ResturantController>(() => ResturantControllerImpl());
    Get.put(CartController(), permanent: true);
    Get.lazyPut<HomeController>(() => HomeControllerImpl());
    Get.lazyPut<CuisineController>(() => CuisineControllerImpl());
    Get.lazyPut(() => OrderHistoryController());
  }
}
