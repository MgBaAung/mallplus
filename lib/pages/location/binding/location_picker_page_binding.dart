import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:mall_plus_new_customer_app/pages/filteredrestaurant/controller/filtered_restaurant_controller.dart';
import 'package:mall_plus_new_customer_app/pages/location/controller/location_picker_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/controllers/main_controller.dart';

class LocationPickerPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationPickerController>(() => LocationPickerControllerImpl());
  }
}
