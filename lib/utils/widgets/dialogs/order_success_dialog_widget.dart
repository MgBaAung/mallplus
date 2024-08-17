import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/order_history_model.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';

import '../../constants/app_route.dart';

class OrderSuccessDialogWidget extends StatelessWidget {
  final OrderHistoryModel order;
  const OrderSuccessDialogWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  width: 21,
                  height: 21,
                  child: SvgPicture.asset("assets/Icons/close.svg"),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 137,
                  child: SvgPicture.asset("assets/Icons/success.svg"),
                ),
                Container(
                  height: 24,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: const Text(
                    "Success Order",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                const Text(
                  "Thank for your order and arrive in next 45 minutes",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    Get.offNamedUntil(AppRoutes.orderHistoryDetail,
                        (route) => route.settings.name == AppRoutes.mainPage,
                        arguments: {"order": order});
                    // Get.offNamed(,
                    //     arguments:);
                  },
                  color: AppColors.primary,
                  child: const Text(
                    "View Order",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
