import 'package:flutter/material.dart';
import 'package:flutter_kpay_kit/flutter_kpay_kit.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/cb_precreate.dart';
import 'package:mall_plus_new_customer_app/models/order_history_model.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/order_controlller.dart';
import 'package:mall_plus_new_customer_app/services/checkout_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/dialogs/order_success_dialog_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants/app_env.dart';

class PaymentController extends GetxController {
  final List<Map<String, dynamic>> paymentList = [
    {
      "title": "KBZ Pay",
      "description": "Payment with kbz pay",
      "image": "assets/Images/kbz pay.png"
    },
    {
      "title": "CB Pay",
      "description": "Payment with CB pay",
      "image": "assets/Images/cb_pay.png"
    },
    {
      "title": "Cash On Delivery",
      "description": "Payment with kbz pay",
      "image": "assets/Images/cod.png"
    },
  ];

  final selectedPayment = <String, dynamic>{}.obs;

  late CheckoutService _checkoutService;

  int voucherId = 0;
  late OrderHistoryModel order;
  late OrderController _orderController;
  @override
  void onInit() {
    selectedPayment.value = paymentList.first;
    _checkoutService = CheckoutServiceImpl();
    _orderController = Get.find();

    super.onInit();
  }

  @override
  void onReady() {
    _getVoucher();
    super.onReady();
  }

  Future _getVoucher() async {
    final res = await _checkoutService.getVoucher();
    if (res.isSuceess) {
      OrderHistoryModel data = res.data as OrderHistoryModel;
      order = data;
      voucherId = (data.id ?? 0).toInt();
    } else {}
  }

  void setPaymentMethod(Map<String, dynamic> value) {
    selectedPayment.value = value;
  }

  Future<void> confirmPayment() async {
    if (selectedPayment == paymentList.first) {
      _makeKbzPayment();
    } else if (selectedPayment == paymentList[2]) {
      _makeCODPayment();
    } else {
      _makeCbPayment();
    }
  }

  Future<void> _makeCbPayment() async {
    Get.dialog(const Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    ));
    final res = await _checkoutService.makeCBPay(voucherId: voucherId);
    Get.back();
    if (res.isSuceess) {
      final data = res.data as CbPrecreateModel;
      if (await canLaunchUrl(Uri.parse(AppEnv.cbLaunchUrl))) {
        launchUrl(Uri.parse(AppEnv.cbLaunchUrl + data.generateRefOrder));
      } else {
        Get.snackbar("Warning", "Please Download CBPay ",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.grey.shade100);
      }
    } else {
      Get.snackbar("Warning", res.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> _makeCODPayment() async {
    Get.dialog(const Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    ));
    final res = await _checkoutService.makePayment(
        voucherId: voucherId, paymentProvider: 1);
    Get.back();
    if (res.isSuceess) {
      Get.dialog(OrderSuccessDialogWidget(
        order: order,
      ));
      //
    } else {
      print("fail payment");
    }
  }

  Future<void> _makeKbzPayment() async {
    FlutterKpayKit.startPay(
      merchCode: AppEnv.merch_code,
      appId: AppEnv.app_id,
      signKey: AppEnv.sign_key,
      orderId: (order.id ?? 0).toString(),
      amount: _orderController.total.toDouble(),
      title: "customer name to Mall Plus Order Payment",
      notifyURL: 'https://mallplusmm.com/api/v1/customer-app/kbz-return-url',
      isProduction: false,
      //Only iOS
      // urlScheme: "kbzpay"
    ).then((res) => print('startPay' + res.toString()));
  }
}
