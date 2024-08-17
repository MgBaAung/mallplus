import 'dart:convert';

import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/user_model.dart';

import 'package:mall_plus_new_customer_app/pages/main/views/widget/my_dialog.dart';
import 'package:mall_plus_new_customer_app/services/checkout_service.dart';
import 'package:mall_plus_new_customer_app/services/local_storage_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';

import '../../../models/resturant_detail_model.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final _cartList = <MenuItems>[].obs;
  List<MenuItems> get cartList => _cartList;

  //Restaurant? restaurant;
  RestaurantDetailModel? restaurantDetailModel;

  List<MenuItems> shuffledItems = [];

  late DateTime orderTime;

  String get total {
    final total = _cartList.fold(0, (previousValue, element) {
      final totalExtraAmt = element.extra.fold(
          0, (previousValue, element) => previousValue + element.price.toInt());

      final requireExtraCost = element.requireExtra?.price ?? 0;

      return previousValue +
          (((element.price - element.discount) * element.qty) +
                  totalExtraAmt +
                  requireExtraCost)
              .toInt();
    });
    return total.toString();
  }

  void addToCart(
      {required MenuItems item,
      required RestaurantDetailModel restaurantDetailModel,
      required DateTime orderTime}) {
    this.orderTime = orderTime;
    if (this.restaurantDetailModel != null &&
        this.restaurantDetailModel?.restaurant.id !=
            restaurantDetailModel.restaurant.id) {
      Get.dialog(MyDialog(
          title: "Warning",
          content:
              "You can only add items from one restaurant at a time to your cart. Adding items from different restaurants is not allowed",
          cancelButtonName: "Cancel",
          yesButtonName: "Continue",
          onPressed: () {
            _cartList.clear();
            _addingCartItem(
                item: item, restaurantDetailModel: restaurantDetailModel);
          },
          cancelOnPressed: () {
            Get.back();
          }));
      return;
    }
    _addingCartItem(item: item, restaurantDetailModel: restaurantDetailModel);
  }

  _addingCartItem(
      {required MenuItems item,
      required RestaurantDetailModel restaurantDetailModel}) {
    this.restaurantDetailModel = restaurantDetailModel;
    final List<Menus> menu = restaurantDetailModel.menus;
    menu.shuffle();
    shuffledItems = menu[0].menuItems;
    shuffledItems.shuffle();

    final isContain = _cartList.firstWhereOrNull((e) => e.id == item.id);
    if (isContain != null) {
      Get.back();
      return;
    }
    _cartList.add(item);

    Get.back();
  }

  void removeItem(MenuItems item) {
    print(item.name);
    _cartList.remove(item);
    _cartList.forEach((element) {
      print(element.name);
    });
  }

  void decreaseQty(MenuItems item) {
    if (item.qty > 1) {
      final index = _cartList.indexOf(item);
      _cartList[index] = item.copyWith(qty: item.qty - 1);
    }
  }

  void increaseQty(MenuItems item) {
    final index = _cartList.indexOf(item);
    _cartList[index] = item.copyWith(qty: item.qty + 1);
  }

  User get _getUser {
    var json = jsonDecode(LocalStorageServie.getData(USER));
    User user = User.fromJson(json);
    return user;
  }

  void clear() {
    _cartList.clear();
    restaurantDetailModel = null;
  }
}
