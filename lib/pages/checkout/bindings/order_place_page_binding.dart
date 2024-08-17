import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/order_controlller.dart';
import 'package:mall_plus_new_customer_app/pages/order_coupon/controller/order_coupon_controller.dart';

import '../pages/delivery_address/controllers/delivery_address_controller.dart';

class OrderPlacePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryAddressController>(() => DeliveryAddressController());
    Get.lazyPut<OrderCouponController>(() => OrderCouponController());
    Get.lazyPut<OrderController>(() => OrderController());
  }
}
