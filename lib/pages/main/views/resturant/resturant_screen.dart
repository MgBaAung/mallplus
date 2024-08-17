import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/base_view_widget.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/resturant/controller/resturant_controller.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/search_widget.dart';

import '../../../../utils/widgets/restaurant_item_widget.dart';

class ResturantScreen extends GetView<ResturantController> {
  const ResturantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SearchWidget(
            hinttext: "Search by food name,shop name",
            icon_path: "assets/Icons/filter-icon.svg",
            onChange: controller.onSearch,
          ),
          Expanded(
            child: BaseViewWidget(
              onRefresh: controller.onRefresh,
              componentState: controller.componentState,
              idDataEmpty: controller.restaurants.isEmpty,
              content: _buildDataContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataContent() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.restaurants.length,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) {
        final restuarant = controller.restaurants[index];

        return RestaurantItemWidget(
          id: restuarant.id.toInt(),
          name: restuarant.name,
          location: "Build 27,San Chaung street,Sanchaung",
          distanceKm: restuarant.distanceKm.toString(),
          deliveryMin: restuarant.deliveryMin.toString(),
          image: restuarant.image,
          //promotionText: restuarant.promotionText,
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
