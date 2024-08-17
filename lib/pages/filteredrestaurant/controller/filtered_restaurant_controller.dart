import 'package:get/get.dart';

import '../../../models/restaurant_model.dart';
import '../../../services/resturant_service.dart';
import '../../../utils/constants/constants.dart';

abstract class FilteredRestaurantController{

  ComponentState get componentState;
  List<RestaurantModel> get restaurants;
  Future<void> onRefresh();
  String get menu;
}
class FilteredRestaurantControllerImpl extends GetxController implements FilteredRestaurantController{

  late final ResturantService _resturantService;

  final _componentState = ComponentState.LOADING.obs;

  final _restaurants = <RestaurantModel>[].obs;

  late int menu_id;
  late String _menu;

  @override
  void onInit() {
    _resturantService = ResturantServiceImpl();
    final args = Get.arguments;
    menu_id= args['menu_id'];
    _menu= args['menu'];
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

  Future _getData() async{
    _componentState.value = ComponentState.LOADING;
    final res = await _resturantService.getResturantsByMenuCategory(menu_id);
    if (res.isSuceess) {
      _restaurants.assignAll(res.data as List<RestaurantModel>);
      _componentState.value = ComponentState.LOADED;
    } else {
      _componentState.value = ComponentState.ERROR;
    }
  }

  @override
  ComponentState get componentState => _componentState.value;

  @override
  List<RestaurantModel> get restaurants => _restaurants.value;

  @override
  String get menu => _menu;

}