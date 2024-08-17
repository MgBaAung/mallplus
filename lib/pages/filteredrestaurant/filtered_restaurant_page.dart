import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mall_plus_new_customer_app/pages/filteredrestaurant/controller/filtered_restaurant_controller.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/back_widget.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/restaurant_item_widget.dart';

import '../../utils/widgets/base_view_widget.dart';
import '../../utils/widgets/search_widget.dart';

class FilteredRestaurantsPage extends GetView<FilteredRestaurantController> {
  const FilteredRestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text(
          "Restaurants with ${controller.menu} menu",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => BaseViewWidget(
          onRefresh: controller.onRefresh,
          componentState: controller.componentState,
          idDataEmpty: controller.restaurants.isEmpty,
          content: _buildDataContent(),
        ),
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
