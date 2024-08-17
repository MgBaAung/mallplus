import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/main/controllers/main_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/home/controller/home_controller.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/cuisine_item_widget.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/menu_item_widgeet.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/network_image_widget.dart';

import '../../../../utils/widgets/base_view_widget.dart';
import '../../../../utils/widgets/restaurant_item_widget.dart';
import '../../../../utils/widgets/search_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(
              hinttext: "Search by food name, shop name",
              icon_path: "assets/Icons/filter-icon.svg",
              onChange: (value) {},
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: Obx(
                () => BaseViewWidget(
                  onRefresh: controller.onRefresh,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.75,
                  componentState: controller.componentState,
                  idDataEmpty: controller.home_data.categorySection != null
                      ? controller.home_data.categorySection!.isEmpty
                      : true,
                  content: controller.home_data != null
                      ? Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                height: 168,
                                // color: Colors.red,
                                width: MediaQuery.of(context).size.width,
                                child: _buildbuttongrid()),
                            SizedBox(
                              height: 15,
                            ),
                            (controller.home_data.specialOffers != null &&
                                    controller
                                        .home_data.specialOffers!.isNotEmpty)
                                ? SizedBox(
                                    height: 200, child: _buildCouponsContent())
                                : SizedBox(),
                            (controller.home_data.specialOffers != null &&
                                    controller
                                        .home_data.specialOffers!.isNotEmpty)
                                ? SizedBox(
                                    height: 15,
                                  )
                                : SizedBox(),
                            (controller.home_data.categorySection != null &&
                                    controller
                                            .home_data.categorySection!.length >
                                        0)
                                ? _buildTitle("Breakfast Top pick", true,
                                    ontap: () {
                                    controller.toscreen(2);
                                  })
                                : SizedBox(),
                            (controller.home_data.categorySection != null &&
                                    controller
                                            .home_data.categorySection!.length >
                                        0)
                                ? SizedBox(
                                    height: 15,
                                  )
                                : SizedBox(),
                            (controller.home_data.categorySection != null &&
                                    controller
                                            .home_data.categorySection!.length >
                                        0)
                                ? Container(
                                    height: 255,
                                    child: _buildbreakfasttopickContent())
                                : SizedBox(),
                            (controller.home_data.categorySection != null &&
                                    controller
                                            .home_data.categorySection!.length >
                                        0)
                                ? SizedBox(
                                    height: 15,
                                  )
                                : SizedBox(),
                            (controller.home_data.specialOffers != null &&
                                    controller
                                        .home_data.specialOffers!.isNotEmpty)
                                ? _buildTitle("Special Day Coupon", false)
                                : SizedBox(),
                            (controller.home_data.specialOffers != null &&
                                    controller
                                        .home_data.specialOffers!.isNotEmpty)
                                ? SizedBox(
                                    height: 15,
                                  )
                                : SizedBox(),
                            (controller.home_data.specialOffers != null &&
                                    controller
                                        .home_data.specialOffers!.isNotEmpty)
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 140.56,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: _buildSpecialOfferContent())
                                : SizedBox(),
                            (controller.home_data.specialOffers != null &&
                                    controller
                                        .home_data.specialOffers!.isNotEmpty)
                                ? SizedBox(
                                    height: 15,
                                  )
                                : SizedBox(),
                            (controller.home_data.restaurants != null &&
                                    controller.home_data.restaurants!.length >
                                        0)
                                ? _buildTitle("Popular Restaurants", true,
                                    ontap: () {
                                    controller.toscreen(1);
                                  })
                                : SizedBox(),
                            (controller.home_data.restaurants != null &&
                                    controller.home_data.restaurants!.length >
                                        0)
                                ? SizedBox(
                                    height: 15,
                                  )
                                : SizedBox(),
                            (controller.home_data.restaurants != null &&
                                    controller.home_data.restaurants!.length >
                                        0)
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 235,
                                    child: _buildPopularRestaurantsContent())
                                : SizedBox(),
                            (controller.home_data.restaurants != null &&
                                    controller.home_data.restaurants!.length >
                                        0)
                                ? SizedBox(
                                    height: 15,
                                  )
                                : SizedBox(),
                            (controller.home_data.menuCategories != null &&
                                    controller
                                            .home_data.menuCategories!.length >
                                        0)
                                ? _buildTitle("Popular Cuisines", true,
                                    ontap: () {
                                    controller.toscreen(2);
                                  })
                                : SizedBox(),
                            (controller.home_data.menuCategories != null &&
                                    controller
                                            .home_data.menuCategories!.length >
                                        0)
                                ? SizedBox(
                                    height: 15,
                                  )
                                : SizedBox(),
                            (controller.home_data.menuCategories != null &&
                                    controller
                                            .home_data.menuCategories!.length >
                                        0)
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 240,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: _buildPopularCuisineWidget())
                                : SizedBox(),
                            (controller.home_data.menuCategories != null &&
                                    controller
                                            .home_data.menuCategories!.length >
                                        0)
                                ? SizedBox(
                                    height: 15,
                                  )
                                : SizedBox(),
                          ],
                        )
                      : SizedBox(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildbuttongrid() {
    List<String> images = [
      'assets/Images/home/mote_zay_tan_default.png',
      'assets/Images/home/coupon_default.png',
      'assets/Images/home/restaurant_default.png',
      'assets/Images/home/promotion_default.png'
    ];

    return StaggeredGrid.count(
      crossAxisCount: 5,
      mainAxisSpacing: 5,
      crossAxisSpacing: 8,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 1.17,
          child: GestureDetector(
              onTap: () {
                AppRoutes.tomotezaytan();
              },
              child: Image.asset(
                images[0],
                fit: BoxFit.fill,
              )),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1.17,
          child: GestureDetector(
              onTap: () {
                AppRoutes.toCoupon();
              },
              child: Image.asset(
                images[1],
                fit: BoxFit.fill,
              )),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1.17,
          child: GestureDetector(
              onTap: () {
                controller.toscreen(1);
              },
              child: Image.asset(
                images[2],
                fit: BoxFit.fill,
              )),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 1.17,
          child: GestureDetector(
              onTap: () {
                AppRoutes.toPromotion(id: 5);
              },
              child: Image.asset(
                images[3],
                fit: BoxFit.fill,
              )),
        ),
      ],
    );
  }

  Widget _buildTitle(String title, bool show_btn, {VoidCallback? ontap}) {
    return Container(
      height: 22,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          show_btn
              ? GestureDetector(
                  onTap: ontap,
                  child: Text(
                    "view all",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF2E3FE8)),
                  ))
              : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildCouponsContent() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 15),
      itemCount: controller.home_data.specialOffers != null
          ? controller.home_data.specialOffers!.length
          : 10,
      // padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemBuilder: (context, index) {
        final special_offers = controller.home_data.specialOffers![index];

        return GestureDetector(
          onTap: () {
            AppRoutes.toPromotion(id: 5);
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: NetworkImageWidget(
                  url:
                      "https://mallplusmm.com/storage/restaurants/sm/${special_offers.image!}",
                  sizeHeight: 154,
                  sizeWidth: (MediaQuery.of(context).size.width - 30))),
        );
      },
    );
  }

  Widget _buildbreakfasttopickContent() {
    return ListView.separated(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: controller.home_data.categorySection != null
          ? controller.home_data.categorySection!.length
          : 10,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemBuilder: (context, index) {
        final menu_category = controller.home_data.categorySection![index];
        return MenuItemWidget(
          name: menu_category.title!,
          width: 175,
          height: 186,
          image: menu_category.imageSmall!,
          promotionText: "",
          rating: "4.5",
          deliveryMin: "30min",
          storage_path: '',
          price: '2000',
        );
      },
    );
  }

  Widget _buildSpecialOfferContent() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: controller.home_data.specialOffers != null
          ? controller.home_data.specialOffers!.length
          : 10,
      // padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemBuilder: (context, index) {
        final special_offers = controller.home_data.specialOffers![index];

        return GestureDetector(
          onTap: () {
            AppRoutes.toCoupon();
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: NetworkImageWidget(
                url:
                    "https://mallplusmm.com/storage/restaurants/sm/${special_offers.image!}",
                sizeHeight: 140.56,
                sizeWidth: 140,
              )),
        );
      },
    );
  }

  Widget _buildPopularRestaurantsContent() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemBuilder: (context, index) {
        final restuarant = controller.home_data.restaurants![index];

        return RestaurantItemWidget(
          id: restuarant.id.toInt(),
          name: restuarant.name,
          location: "Build 27,San Chaung street,Sanchaung",
          distanceKm: restuarant.distanceKm.toString(),
          deliveryMin: restuarant.deliveryMin.toString(),
          image: restuarant.image,
          width: 331,
          height: 260,
          promotionText: restuarant.promotionText,
          rating: restuarant.rating,
          serviceStatus: restuarant.serviceStatus,
          openTime: restuarant.openingTime,
          closeTime: restuarant.closingTime,
        );
      },
    );
  }

  Widget _buildPopularCuisineWidget() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
            childAspectRatio: 0.80 / 1),
        itemCount: 8,
        itemBuilder: (context, index) {
          final menu_categories = controller.home_data.menuCategories![index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                            width: 83,
                            height: 83,
                            child: NetworkImageWidget(
                              url:
                                  "https://mallplusmm.com/storage/cuisines/sm/${menu_categories.image!}",
                              sizeHeight: 83,
                              sizeWidth: 83,
                              fit: BoxFit.cover,
                            ))),
                  ),
                  Text(
                    menu_categories.name!,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        });
  }
}
