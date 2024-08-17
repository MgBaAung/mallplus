import '../../../../../models/home_data_model.dart';
import '../../../../../services/cuisine_service.dart';
import '../../../../../services/home_service.dart';
import '../../../../../utils/constants/constants.dart';
import 'package:get/get.dart';

import '../../../controllers/main_controller.dart';
abstract class CuisineController{
  ComponentState get componentState;
  // List<MenuCategories> get menu_category;
  HomeData get home_data;
  Future<void> onRefresh();
}

class CuisineControllerImpl extends GetxController implements CuisineController{

  final _componentState = ComponentState.LOADING.obs;
  // final _menu_category = <MenuCategories>[].obs;
  final _home_data = HomeData().obs;


  late final CuisineService _cuisindService;

  ComponentState get componentState => _componentState.value;

  @override
  void onInit() {
    _cuisindService = CuisineServiceImpl();
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
    final res = await _cuisindService.getHomeData();
    if (res.isSuceess) {
      // _mainService.assignAll(res.data as List<RestaurantModel>);
      print("type of res.data");
      print(res.data.runtimeType);
      // _menu_category(res.data as List<MenuCategories>);
      _home_data(res.data);
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


}