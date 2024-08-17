import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_place_picker_mb/providers/place_provider.dart';
import 'package:mall_plus_new_customer_app/models/user_address_model.dart';
import 'package:mall_plus_new_customer_app/pages/main/controllers/main_controller.dart';
import 'package:mall_plus_new_customer_app/services/local_storage_service.dart';
import 'package:mall_plus_new_customer_app/services/user_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';
import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';

import '../../../models/user_model.dart';

abstract class LocationPickerController {
  UserAddress get address;
  Future<void> placepicked(PickResult result);
  Future<void> cameraidele(PlaceProvider result);
  Future<void> saveAddress(
      {required String address_detail,
      required String floor,
      String? note_to_biker});
}

class LocationPickerControllerImpl extends GetxController
    implements LocationPickerController {
  final _address = UserAddress().obs;
  late UserService _locationService;
  late MainController _mainController;
  late String _action;
  late int _user_id;
  late UserAddress pickedaddress;

  @override
  void onInit() async {
    _mainController = Get.find();
    _locationService = UserServiceImpl();
    if (await LocalStorageServie.iskeyexists(USER)) {
      var json = jsonDecode(await LocalStorageServie.getData(USER));
      User user = User.fromJson(json);
      _user_id = user.id!;
    } else {
      _user_id = 0;
    }
    var args = Get.arguments;
    _action = args['action'];
    super.onInit();
  }

  @override
  // TODO: implement address
  UserAddress get address => _address.value;

  @override
  Future<void> cameraidele(PlaceProvider result) async {
    print("latitude : ${result.currentPosition!.latitude}");
    pickedaddress = UserAddress(
        user_id: _user_id,
        latitude: result.cameraPosition!.target.latitude,
        longitude: result.cameraPosition!.target.longitude);
    _address(pickedaddress);
  }

  @override
  Future<void> placepicked(PickResult result) async {
    print("latitude : ${result.geometry!.location.lat}");
    pickedaddress = UserAddress(
        user_id: _user_id,
        latitude: result.geometry!.location.lat,
        longitude: result.geometry!.location.lng);
    _address(pickedaddress);
  }

  @override
  Future<void> saveAddress(
      {required String address_detail,
      required String floor,
      String? note_to_biker}) async {
    UserAddress addr = address.copyWith(
        address: '-',
        address_detail: address_detail,
        floor: floor,
        note_to_biker: note_to_biker ?? "");
    print(addr);
    final res = await _locationService.savenewUserAddresses(
        action: _action, address: addr);
    if (res.isSuceess) {
      _mainController.setnearestAddress(address);
      await _mainController.onRefresh();
      Get.back();
    }
  }
}
