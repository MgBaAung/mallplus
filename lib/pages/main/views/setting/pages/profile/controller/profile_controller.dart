import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/user_model.dart';
import 'package:mall_plus_new_customer_app/services/user_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';

class ProfileController extends GetxController {
  late TextEditingController _nameCtl;
  TextEditingController get nameCtl => _nameCtl;

  late UserService _userService;

  final _componentState = ComponentState.LOADING.obs;

  ComponentState get componentState => _componentState.value;

  final _phone = "".obs;
  String get phone => _phone.value;

  int _id = 0;
  String _oorginalName = "";

  @override
  void onInit() {
    _nameCtl = TextEditingController();
    _userService = UserServiceImpl();
    super.onInit();
  }

  Future onRefresh() async {
    _getUserProfile();
  }

  @override
  void onReady() {
    _getUserProfile();
    super.onReady();
  }

  Future _getUserProfile() async {
    _componentState.value = ComponentState.LOADING;
    final res = await _userService.getUserProfile();
    _componentState.value = ComponentState.LOADED;
    if (res.isSuceess) {
      User user = res.data as User;
      _nameCtl.text = user.name ?? "";
      _phone.value = user.phone ?? "";
      _oorginalName = user.name ?? "";
      _id = user.id ?? 0;
    }
  }

  Future updateProfile() async {
    if (_nameCtl.text.trim().isEmpty) {
      _nameCtl.text = _oorginalName;
      return;
    }
    print("upate");
    Get.dialog(
        const Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
        barrierDismissible: false);
    await _userService.updateProfile(
        id: _id.toString(), name: _nameCtl.text.trim());
    Get.back();
  }
}
