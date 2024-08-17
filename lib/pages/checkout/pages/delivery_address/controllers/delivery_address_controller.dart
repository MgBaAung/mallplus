import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/user_save_address_model.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/cart_controller.dart';

import 'package:mall_plus_new_customer_app/services/user_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';

class DeliveryAddressController extends GetxController {
  late UserService _locationService;
  late CartController _cartController;

  @override
  void onInit() {
    _locationService = UserServiceImpl();
    _cartController = Get.find();
    super.onInit();
  }

  final _userAddresses = <UserSaveAddressModel>[].obs;

  List<UserSaveAddressModel> get userAddresses => _userAddresses;

  final _selectUserAddress = UserSaveAddressModel.emptyObj().obs;

  UserSaveAddressModel get selectedUserAddress => _selectUserAddress.value;

  final _componentState = ComponentState.LOADING.obs;

  ComponentState get componentState => _componentState.value;

  @override
  void onReady() {
    _getUserAddress();
    super.onReady();
  }

  Future<void> _getUserAddress() async {
    _componentState.value = ComponentState.LOADING;
    final response = await _locationService.getUserAddresses();
    _componentState.value = ComponentState.LOADED;
    if (response.isSuceess) {
      final data = response.data as List<UserSaveAddressModel>;

      _userAddresses.assignAll(data);
      if (data.isNotEmpty) _selectUserAddress.value = data.first;
    }
  }

  Future<void> onRefresh() async {
    _getUserAddress();
  }

  void setUserAddress(UserSaveAddressModel data) {
    final distance = _calculateDistance(
        _cartController.restaurantDetailModel?.restaurant.latitude.toDouble() ??
            0,
        _cartController.restaurantDetailModel?.restaurant.longitude
                .toDouble() ??
            0,
        data.latitude.toDouble(),
        data.longitude.toDouble());
    if (distance > 30) {
      Get.snackbar("Not Availabe Address",
          "We can't deliver to your selected address. Please try another one",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          icon: Icon(
            Icons.map,
            color: Colors.red,
          ));

      return;
    }
    _selectUserAddress.value = data;
    Get.back();
  }

  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double radiusEarthKm = 6371.0; // Radius of the Earth in kilometers

    // Convert latitude and longitude from degrees to radians
    double lat1Rad = _degreesToRadians(lat1);
    double lon1Rad = _degreesToRadians(lon1);
    double lat2Rad = _degreesToRadians(lat2);
    double lon2Rad = _degreesToRadians(lon2);

    // Calculate the differences between latitudes and longitudes
    double dLat = lat2Rad - lat1Rad;
    double dLon = lon2Rad - lon1Rad;

    // Apply the Haversine formula
    double a = pow(sin(dLat / 2), 2) +
        cos(lat1Rad) * cos(lat2Rad) * pow(sin(dLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Calculate the distance
    double distance = radiusEarthKm * c;
    return distance;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }
}
