import 'package:get/get.dart';

import '../controllers/food_detail_controller.dart';

class FoodDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodDetailController>(() => FoodDetailControllerImpl());
  }
}
