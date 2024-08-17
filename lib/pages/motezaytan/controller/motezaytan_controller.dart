import 'package:get/get.dart';

abstract class MoteZayTanController {

  Future<void> onRefresh();
}

class MoteZayTanControllerImpl extends GetxController implements MoteZayTanController{
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  Future<void> onRefresh() {
    throw UnimplementedError();
  }


}