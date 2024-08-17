import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/payment_controller.dart';

class PaymentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}
