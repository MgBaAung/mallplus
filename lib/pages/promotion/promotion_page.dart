import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/promotion/controller/promotion_controller.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/back_widget.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/search_widget.dart';

import '../../utils/widgets/base_view_widget.dart';
import '../../utils/widgets/restaurant_item_widget.dart';

class PromotionPage extends GetView<PromotionController> {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: CustomBackButton(),
        title: Text(
          "Promotions",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SearchWidget(
              hinttext: "Enter restaurant name",
              icon_path: "assets/Icons/filter-icon.svg",
              onChange: (String value) {},
            ),
            Expanded(
              child: Obx(() {
                return BaseViewWidget(
                  onRefresh: controller.onRefresh,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  componentState: controller.componentState,
                  idDataEmpty: controller.promo.isEmpty,
                  content: Container(
                    width: Get.size.width,
                    height: Get.size.height,
                    child: Obx(
                      () => BaseViewWidget(
                        onRefresh: controller.onRefresh,
                        componentState: controller.componentState,
                        idDataEmpty: controller.promo.isEmpty,
                        content: _buildDataContent(),
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDataContent() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.promo.length,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) {
        final restuarant = controller.promo[index];

        return RestaurantItemWidget(
          id: restuarant.id.toInt(),
          name: restuarant.name,
          location: "Build 27,San Chaung street,Sanchaung",
          distanceKm: restuarant.distanceKm.toString(),
          deliveryMin: restuarant.deliveryMin.toString(),
          image: restuarant.image,
          promotionText: restuarant.promotionText,
          rating: restuarant.rating,
          serviceStatus: restuarant.serviceStatus,
          openTime: restuarant.openingTime,
          closeTime: restuarant.closingTime,
        );
      },
    );
  }
}
