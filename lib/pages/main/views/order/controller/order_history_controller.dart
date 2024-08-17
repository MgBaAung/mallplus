import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/order_history_model.dart';
import 'package:mall_plus_new_customer_app/services/order_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';

class OrderHistoryController extends GetxController {
  late final OrderService _orderService;

  final _componentState = ComponentState.LOADED.obs;
  ComponentState get componentState => _componentState.value;

  final _orderHistories = <OrderHistoryModel>[].obs;
  List<OrderHistoryModel> get orderHistories => _orderHistories;

  @override
  void onInit() {
    _orderService = OrderServiceImpl();
    super.onInit();
  }

  Future getOrderHistories() async {
    _componentState.value = ComponentState.LOADING;
    final res = await _orderService.getOrderHistories();
    _componentState.value = ComponentState.LOADED;
    if (res.isSuceess) {
      final data = res.data as List<OrderHistoryModel>;
      _orderHistories.assignAll(data);
    }
  }

  Future onRefresh() async {
    getOrderHistories();
  }
}
