import 'dart:ffi';

import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/resturant_detail_model.dart';
import 'package:mall_plus_new_customer_app/pages/restaurant_detail/widgets/pre_order_bottomsheet_widget.dart';
import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';

import '../../../services/resturant_service.dart';

abstract class RestaurantDetailController {
  ComponentState get componentState;
  RestaurantDetailModel get restaurantDetail;
  DateTime get orderTime;
  void setPreOrderTime(DateTime time);
  bool get preOrderStatus;
  Future<void> onRefresh();
}

class RestaurantDetailControllerImpl extends GetxController
    implements RestaurantDetailController {
  late final ResturantService _resturantService;
  late int _id;
  late bool _preOrderStatus;

  final _orderTime = DateTime.now().obs;

  @override
  DateTime get orderTime => _orderTime.value;

  @override
  void setPreOrderTime(DateTime time) {
    _orderTime.value = time;
    update();
  }

  @override
  void onInit() {
    _resturantService = ResturantServiceImpl();
    _id = Get.arguments["id"];
    _preOrderStatus = Get.arguments["pre_order_status"];
    super.onInit();
  }

  @override
  ComponentState get componentState => _componentState.value;
  final _componentState = ComponentState.LOADING.obs;

  final _restaurantDetail = RestaurantDetailModel.emptyObj().obs;
  // @override
  // TabController get tabController => _tabController;

  @override
  void onReady() {
    _getRestaurantDetail();

    super.onReady();
  }

  Future<void> _getRestaurantDetail() async {
    _componentState.value = ComponentState.LOADING;

    final res = await _resturantService.getResturantDetail(id: _id);

    if (res.isSuceess) {
      _restaurantDetail.value = res.data as RestaurantDetailModel;

      _componentState.value = ComponentState.LOADED;
      if (_preOrderStatus) {
        Get.bottomSheet(
          const PreOrderBottomSheetWidget(),
        );
      }
    } else {
      _componentState.value = ComponentState.ERROR;
    }
    // _tabController=TabController(length: restaurantDetail.menus.length, vsync: vsync)
  }

  @override
  Future<void> onRefresh() async {
    _getRestaurantDetail();
  }

  @override
  RestaurantDetailModel get restaurantDetail => _restaurantDetail.value;

  @override
  bool get preOrderStatus => _preOrderStatus;
}
