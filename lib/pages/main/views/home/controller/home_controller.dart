import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/home_data_model.dart';
import 'package:mall_plus_new_customer_app/models/menu_categories_model.dart';
import 'package:mall_plus_new_customer_app/pages/main/controllers/main_controller.dart';
import 'package:mall_plus_new_customer_app/services/home_service.dart';
import 'package:mall_plus_new_customer_app/services/main_service.dart';

import '../../../../../models/restaurant_model.dart';
import '../../../../../utils/constants/constants.dart';

abstract class HomeController{
  ComponentState get componentState;
  // List<MenuCategories> get menu_category;
  HomeData get home_data;
  void toscreen(int index);
  Future<void> onRefresh();
}

class HomeControllerImpl extends GetxController implements HomeController{

  final _componentState = ComponentState.LOADING.obs;
  // final _menu_category = <MenuCategories>[].obs;
  final _home_data = HomeData().obs;
  late final MainController _mainController;


  late final HomeService _homeService;

  ComponentState get componentState => _componentState.value;



  @override
  void onInit() {
    _homeService = HomeServiceImpl();
    _mainController = Get.find();
    super.onInit();
  }

  @override
  Future<void> onRefresh() async {
    _getData();
  }
  @override
  void onReady() {
    _getData();
    super.onReady();
  }



  Future _getData() async {
    _componentState.value = ComponentState.LOADING;
    final res = await _homeService.getHomeData();
    if (res.isSuceess) {
      // _mainService.assignAll(res.data as List<RestaurantModel>);
      print("type of res.data");
      print(res.data.runtimeType);
      // _menu_category(res.data as List<MenuCategories>);
      _home_data(res.data);
      if(_mainController.nearestAddress.title == null){
        _mainController.setnearestAddress(home_data.userInfo!.nearestAddress!);
      }
      // _mainController.setnearestAddress(_home_data.value.userInfo!.nearestAddress!);
      _mainController.setAddresses(_home_data.value.userInfo!.addresses!);
      _componentState.value = ComponentState.LOADED;
    } else {
      _componentState.value = ComponentState.ERROR;
    }
  }
  // @override
  // List<MenuCategories> get menu_category => _menu_category;

  @override
  // TODO: implement home_data
  HomeData get home_data =>_home_data.value;

  @override
  void toscreen(int index) {
    _mainController.onPageChange(index);
  }

}