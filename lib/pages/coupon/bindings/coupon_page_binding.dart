
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:mall_plus_new_customer_app/pages/coupon/controller/coupon_controller.dart';

class CouponPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponController>(() => CouponControllerImpl());
  }
}
