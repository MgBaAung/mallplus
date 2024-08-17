import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:mall_plus_new_customer_app/pages/filteredrestaurant/controller/filtered_restaurant_controller.dart';

class FilteredRestaurantPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilteredRestaurantController>(() => FilteredRestaurantControllerImpl());
  }
}
