import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/cart_controller.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';

import '../../../models/resturant_detail_model.dart';

abstract class FoodDetailController {
  MenuItems get item;
  String get quantity;
  String get total;
  void increaseQty();
  void decreaseQty();
  void toggleAddOptionalExtra(Extra data);
  List<Extra> get optionalExtras;
  Extra get selectedRequireExtra;
  void setSelectedRequireExtra(Extra value);
  void addToCart();
  void orderNow();
}

class FoodDetailControllerImpl extends GetxController
    implements FoodDetailController {
  late MenuItems _item;
  late RestaurantDetailModel _restaurantDetailModel;
  @override
  MenuItems get item => _item;

  late CartController _cartController;
  late DateTime _orderTime;
  @override
  void onInit() {
    _item = Get.arguments["item"] as MenuItems;
    _restaurantDetailModel =
        Get.arguments["restaurantDetailModel"] as RestaurantDetailModel;
    _cartController = Get.find();
    _orderTime = Get.arguments["pre_order_time"];

    super.onInit();
  }

  @override
  void onReady() {
    _selectDefalutRequireqExtra();
    super.onReady();
  }

  void _selectDefalutRequireqExtra() {
    for (var option in item.options) {
      if (option.type == "radio") {
        for (var i = 0; i < option.children.length; i++) {
          if (i == option.selectedId) {
            _selectedRequireExtra.value = option.children[i];
          }
        }
      }
    }
  }

  final _quantity = 1.obs;
  @override
  String get quantity => _quantity.value.toString();

  @override
  void decreaseQty() {
    if (_quantity.value > 1) {
      _quantity.value--;
    }
  }

  @override
  void increaseQty() {
    _quantity.value++;
  }

  @override
  String get total {
    final totalExtraAmt = _optionalExtras.fold(
        0, (previousValue, element) => previousValue + element.price.toInt());

    return (((item.price - item.discount) +
                totalExtraAmt +
                selectedRequireExtra.price.toInt() +
                item.packaging) *
            _quantity.value)
        .toString();
    // final totalExtraAmt = widget.item.extra.fold(
    //     0, (previousValue, element) => previousValue + element.price.toInt());

    // String amount = (((widget.item.price - widget.item.discount) +
    //             totalExtraAmt +
    //             (widget.item.requireExtra?.price ?? 0) +
    //             widget.item.packaging) *
    //         widget.item.qty)
    //     .toString();
  }

  final List<Extra> _optionalExtras = <Extra>[].obs;
  @override
  List<Extra> get optionalExtras => _optionalExtras;

  @override
  void toggleAddOptionalExtra(Extra data) {
    if (_optionalExtras.contains(data)) {
      _optionalExtras.remove(data);
      return;
    }
    _optionalExtras.add(data);
  }

  @override
  void addToCart() {
    final data = item.copyWith(
      qty: _quantity.value,
      optionalExtra: _optionalExtras,
      requireExtra: _selectedRequireExtra.value,
    );

    _cartController.addToCart(
        item: data,
        restaurantDetailModel: _restaurantDetailModel,
        orderTime: _orderTime);
  }

  final _selectedRequireExtra = Extra.emptyObj().obs;

  @override
  Extra get selectedRequireExtra => _selectedRequireExtra.value;

  @override
  void setSelectedRequireExtra(Extra value) {
    _selectedRequireExtra.value = value;
    // TODO: implement setSelectedRequireExtra
  }

  @override
  void orderNow() {
    final data = item.copyWith(
      qty: _quantity.value,
      optionalExtra: _optionalExtras,
      requireExtra: _selectedRequireExtra.value,
    );
    AppRoutes.toOrderPlacePage(
        item: data,
        restaurant: _restaurantDetailModel.restaurant,
        orderTime: _orderTime);
  }
}
