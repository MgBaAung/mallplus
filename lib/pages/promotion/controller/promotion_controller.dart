import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/restaurant_model.dart';
import 'package:mall_plus_new_customer_app/services/promo_service.dart';

import '../../../utils/constants/constants.dart';

abstract class PromotionController {

  Future<void> onRefresh();

  ComponentState get componentState;
  List<RestaurantModel> get promo;
}

class PromotionControllerImpl extends GetxController implements PromotionController{
  final _componentState = ComponentState.LOADING.obs;
  final _promo = <RestaurantModel>[].obs;

  late final int id;

  late final PromoService _promoService;

  @override
  void onInit() {
    final args = Get.arguments;
    id= args['id'];
    _promoService = PromoServiceImpl();
    super.onInit();
  }
  @override
  void onReady() async {
    _getData();
    super.onReady();
  }

  @override
  Future<void> onRefresh() async {
    _getData();
  }

  Future _getData() async {
    _componentState.value = ComponentState.LOADING;
    final res = await _promoService.getPromoRestaurants(id: id);
    if (res.isSuceess) {
      // _mainService.assignAll(res.data as List<RestaurantModel>);
      print("type of res.data");
      print(res.data.runtimeType);
      // _menu_category(res.data as List<MenuCategories>);
      _promo(res.data);
      _componentState.value = ComponentState.LOADED;
    } else {
      _componentState.value = ComponentState.ERROR;
    }

  }

  @override
  // TODO: implement componentState
  ComponentState get componentState => _componentState.value;

  @override
  // TODO: implement coupons
  List<RestaurantModel> get promo => _promo.value;


}