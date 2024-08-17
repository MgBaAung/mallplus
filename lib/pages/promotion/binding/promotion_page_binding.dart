
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:mall_plus_new_customer_app/pages/promotion/controller/promotion_controller.dart';

class PromotionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromotionController>(() => PromotionControllerImpl());
  }
}
