import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/restaurant_detail/controllers/restaurant_detail_controller.dart';

class RestaurantDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantDetailController>(
        () => RestaurantDetailControllerImpl());
  }
}
