import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/services/coupon_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';

import '../../../models/order_coupon_model.dart';

class OrderCouponController extends GetxController {
  final _componentState = ComponentState.LOADING.obs;
  ComponentState get componentState => _componentState.value;

  late CouponService _couponService;

  final _coupons = <OrderCouponModel>[].obs;

  List<OrderCouponModel> get coupons => _coupons.value;

  final _selectedCoupon = Rxn<OrderCouponModel>();
  OrderCouponModel? get selectedCoupon => _selectedCoupon.value;

  setCoupon(OrderCouponModel data) {
    _selectedCoupon.value = data;
    Get.back();
  }

  @override
  void onReady() {
    _couponService = CouponServiceImpl();
    _getCoupon();
    super.onReady();
  }

  _getCoupon() async {
    _componentState.value = ComponentState.LOADING;
    final res = await _couponService.getOrderCoupons(id: 1364);
    _componentState.value = ComponentState.LOADED;
    if (res.isSuceess) {
      _coupons.value = res.data as List<OrderCouponModel>;
    }
  }

  getHiddenCoupon(String value) async {
    _componentState.value = ComponentState.LOADING;
    final res = await _couponService.searchOrderCoupons(code: value);
    _componentState.value = ComponentState.LOADED;
    print(res.message);
    if (res.isSuceess) {
      _coupons.value = res.data as List<OrderCouponModel>;
    } else {
      print("hhh");
      _coupons.clear();
      _componentState.value = ComponentState.ERROR;
    }
  }

  Future<void> onRefresh() async {
    _getCoupon();
  }
}
