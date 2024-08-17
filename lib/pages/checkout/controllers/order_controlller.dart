import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/cart_controller.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/pages/delivery_address/controllers/delivery_address_controller.dart';
import 'package:mall_plus_new_customer_app/pages/order_coupon/controller/order_coupon_controller.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';

import '../../../models/resturant_detail_model.dart';
import '../../../services/checkout_service.dart';

class OrderController extends GetxController {
  late List<MenuItems> cartList;
  late CartController _cartController;
  late CheckoutService _checkoutService;
  late Restaurant? _restaurant;
  late DateTime? _orderTime;
  late OrderCouponController _orderCouponController;
  @override
  void onInit() {
    _orderCouponController = Get.find();
    _cartController = Get.find();
    _checkoutService = CheckoutServiceImpl();
    final args = Get.arguments;
    _orderTime = Get.arguments["orderTime"];
    if (args["item"] != null && args["restaurant"] != null) {
      _restaurant = args["restaurant"] as Restaurant;
      cartList = [args["item"] as MenuItems];
    } else {
      _restaurant = _cartController.restaurantDetailModel!.restaurant;
      cartList = _cartController.cartList;
    }

    if (_restaurant == null) Get.back();

    super.onInit();
  }

  num get subTotal {
    final total = cartList.fold(0, (previousValue, element) {
      final totalExtraAmt = element.extra.fold(
          0, (previousValue, element) => previousValue + element.price.toInt());

      final requireExtraCost = element.requireExtra?.price ?? 0;

      return previousValue +
          (((element.price - element.discount) * element.qty) +
                  totalExtraAmt +
                  requireExtraCost)
              .toInt();
    });
    return total;
  }

  num get total {
    return subTotal - coupon + delivery + tax;
  }

  num get tax {
    return _restaurant?.tax ?? 0;
  }

  num get coupon {
    return _orderCouponController.selectedCoupon?.discountAmount ?? 0;
  }

  num get delivery {
    return _restaurant?.deliveryFee ?? 0;
  }

  Future<void> saveOrder() async {
    DeliveryAddressController addressController = Get.find();
    Get.dialog(
        const Dialog(
          backgroundColor: Colors.transparent,
          child: Center(child: CircularProgressIndicator.adaptive()),
        ),
        barrierDismissible: false);
    final res = await _checkoutService.saveOrder(
        items: cartList,
        restaurant: _restaurant!,
        address: addressController.selectedUserAddress,
        orderTime: _orderTime ?? _cartController.orderTime);
    Get.back();
    if (res.isSuceess) {
      // Get.snackbar(
      //   "Order",
      //   "Your order successfully",
      //   icon: const Icon(Icons.check, color: AppColors.green),
      //   backgroundColor: AppColors.secondaryLight9,
      // );
      //_cartController.clear();

      AppRoutes.toPaymentPage(voucherId: 0);
    } else {
      Get.snackbar(
        "Order",
        "Order fail !",
        icon: const Icon(Icons.error, color: AppColors.primary),
        backgroundColor: AppColors.secondaryLight9,
      );
    }
  }
}
