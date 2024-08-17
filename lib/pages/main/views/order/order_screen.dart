import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:mall_plus_new_customer_app/pages/main/views/order/controller/order_history_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/order/views/cancel_order_view.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/order/views/complete_order_view.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/order/views/current_order_view.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/base_view_widget.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/network_image_widget.dart';

class OrderScreen extends GetView<OrderHistoryController> {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: Obx(
          () => BaseViewWidget(
            onRefresh: controller.onRefresh,
            componentState: controller.componentState,
            content: SizedBox(
              height: Get.height - 200,
              child: _buildDataWidget(),
            ),
          ),
        ));
  }

  DefaultTabController _buildDataWidget() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TabBar(
                dividerHeight: 0,
                indicatorWeight: 0,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.symmetric(horizontal: 4),
                labelColor: AppColors.primary,
                indicator: BoxDecoration(
                  color: AppColors.primaryLight8,
                  //border: Border.all(color: AppColors.neutral9),
                  borderRadius: BorderRadius.circular(4),
                ),
                tabs: [
                  _buildTabWidget("Current"),
                  _buildTabWidget("Complete"),
                  _buildTabWidget("Cancel"),
                ]),
          ),
          Expanded(
            child: TabBarView(
              children: [
                CurrentOrderView(
                    orderHistories: controller.orderHistories
                        .where(
                            (element) => (element.orderFinishStatus ?? 0) == 0)
                        .toList()),
                CompleteOrderView(
                    orderHistories: controller.orderHistories
                        .where(
                            (element) => (element.orderFinishStatus ?? 0) == 1)
                        .toList()),
                CancelOrderView(orderHistories: controller.orderHistories)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabWidget(String label) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // color: Colors.red,
        border: Border.all(color: AppColors.neutral9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(child: Text(label)),
    );
  }
}
