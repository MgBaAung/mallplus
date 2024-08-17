import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/services/coupon_service.dart';

import '../../../models/coupon_list_model.dart';
import '../../../utils/constants/constants.dart';

abstract class CouponController {
  Future<void> onRefresh();

  ComponentState get componentState;
  List<Coupon> get coupons;
}

class CouponControllerImpl extends GetxController implements CouponController{

  final _componentState = ComponentState.LOADING.obs;
  final _coupons = <Coupon>[].obs;

  late final CouponService _couponService;
  @override
  void onInit() {
    _couponService = CouponServiceImpl();
    super.onInit();
  }
  @override
  void onReady() {
    _getData();
    super.onReady();
  }

  @override
  Future<void> onRefresh() async {
    _getData();
    ;
  }

  Future _getData() async {
    _componentState.value = ComponentState.LOADING;
    final res = await _couponService.getCoupons();
    if (res.isSuceess) {
      // _mainService.assignAll(res.data as List<RestaurantModel>);
      print("type of res.data");
      print(res.data.runtimeType);
      // _menu_category(res.data as List<MenuCategories>);
      _coupons(res.data);
      _componentState.value = ComponentState.LOADED;
    } else {
      _componentState.value = ComponentState.ERROR;
    }

  }

  @override
  List<Coupon> get coupons => _coupons.value;


  @override
  ComponentState get componentState => _componentState.value;

}