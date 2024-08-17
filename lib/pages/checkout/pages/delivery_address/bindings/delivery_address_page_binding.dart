import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/pages/delivery_address/controllers/delivery_address_controller.dart';

class DeliveryAddressPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryAddressController>(() => DeliveryAddressController());
  }
}
