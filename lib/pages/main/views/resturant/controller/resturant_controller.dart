import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:mall_plus_new_customer_app/models/restaurant_model.dart';
import 'package:mall_plus_new_customer_app/services/resturant_service.dart';

import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';

abstract class ResturantController {
  ComponentState get componentState;
  List<RestaurantModel> get restaurants;
  Future<void> onRefresh();
  Future<void> onSearch(String value);
  Future<void> getRestaurants();
  // Future<void> onSubmit(String value);
}

class ResturantControllerImpl extends GetxController
    implements ResturantController {
  late final ResturantService _resturantService;
  late final Debouncer _debouncer;
  @override
  void onInit() {
    log("message");
    _debouncer = Debouncer(delay: const Duration(seconds: 1));
    _resturantService = ResturantServiceImpl();
    super.onInit();
  }

  final _componentState = ComponentState.LOADING.obs;

  ComponentState get componentState => _componentState.value;

  final _restaurants = <RestaurantModel>[].obs;
  @override
  List<RestaurantModel> get restaurants => _restaurants;

  @override
  Future<void> onRefresh() async {
    getRestaurants();
  }

  @override
  Future getRestaurants() async {
    _componentState.value = ComponentState.LOADING;
    final res = await _resturantService.getResturants();
    if (res.isSuceess) {
      _restaurants.assignAll(res.data as List<RestaurantModel>);
      _componentState.value = ComponentState.LOADED;
    } else {
      _componentState.value = ComponentState.ERROR;
    }
  }

  @override
  Future<void> onSearch(String value) async {
    _debouncer.call(() async {
      if (_componentState.value == ComponentState.LOADING) return;
      if (value.isEmpty) {
        await getRestaurants();
      } else {
        await _searchRestaurant(value);
      }
    });
  }

  Future<void> _searchRestaurant(String value) async {
    _componentState.value = ComponentState.LOADING;
    final res = await _resturantService.searchResturants(searchString: value);
    if (res.isSuceess) {
      _restaurants.assignAll(res.data as List<RestaurantModel>);
      _componentState.value = ComponentState.LOADED;
    } else {
      _componentState.value = ComponentState.ERROR;
    }
  }
}
