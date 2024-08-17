import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/cart_controller.dart';
import 'package:mall_plus_new_customer_app/pages/restaurant_detail/controllers/restaurant_detail_controller.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';

import 'package:mall_plus_new_customer_app/utils/widgets/base_view_widget.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/network_image_widget.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:mall_plus_new_customer_app/models/resturant_detail_model.dart';
import '../../utils/constants/app_colors.dart';
import 'widgets/pre_order_bottomsheet_widget.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class RestaurantDetailPage extends GetView<RestaurantDetailController> {
  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: MaterialButton(
          onPressed: () {
            Get.back();
          },
          child: Row(
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  'assets/Icons/back.svg',
                  // colorFilter:
                  //     const ColorFilter.mode(AppColors.green, BlendMode.srcIn),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text("Back")
            ],
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Restaurant Detail",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        actions: [
          GetBuilder<CartController>(
            builder: (cartController) {
              return Obx(
                () => IconButton(
                  onPressed: () {
                    AppRoutes.toCartView();
                  },
                  icon: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    child: SizedBox(
                      width: 30,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/Icons/cart.svg',
                            colorFilter: ColorFilter.mode(
                                cartController.cartList.isEmpty
                                    ? AppColors.neutral1
                                    : AppColors.primary,
                                BlendMode.srcIn),
                          ),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 17,
                                height: 17,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Text(
                                  (cartController.cartList.length < 9
                                          ? cartController.cartList.length
                                          : "9+")
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Obx(
        () => BaseViewWidget(
            onRefresh: controller.onRefresh,
            componentState: controller.componentState,
            content: ScrollableRestaurantDetail(
              controller: controller,
            )),
      ),
    );
  }
}

class ScrollableRestaurantDetail extends StatefulWidget {
  final RestaurantDetailController controller;
  const ScrollableRestaurantDetail({super.key, required this.controller});

  @override
  State<ScrollableRestaurantDetail> createState() =>
      _ScrollableRestaurantDetailState();
}

class _ScrollableRestaurantDetailState extends State<ScrollableRestaurantDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late AutoScrollController _autoScrollController;

  @override
  void initState() {
    _tabController = TabController(
        length: widget.controller.restaurantDetail.menus.length, vsync: this);
    _autoScrollController = AutoScrollController();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ScrollableRestaurantDetail oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height - 100,
      child: VerticalScrollableTabView(
        autoScrollController: _autoScrollController,
        tabController: _tabController,
        // listItemData: [],
        listItemData: widget.controller.restaurantDetail.menus,
        eachItemChild: (object, index) {
          final menu = widget.controller.restaurantDetail.menus[index];
          return _tabBarViewSection(menu);
        },
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            //shadowColor: Colors.grey,
            automaticallyImplyLeading: false,
            expandedHeight: 400,
            flexibleSpace: _restaurantDetailWidget(),
            bottom: _tabBarWidget(),
          )
        ],
      ),
    );
  }

  FlexibleSpaceBar _restaurantDetailWidget() {
    final String image = widget.controller.restaurantDetail.restaurant.image;
    final String name = widget.controller.restaurantDetail.restaurant.name;
    final String rating = widget.controller.restaurantDetail.restaurant.rating;
    final String distance =
        widget.controller.restaurantDetail.restaurant.distanceKm.toString();
    final num deliveryMin =
        widget.controller.restaurantDetail.restaurant.deliveryMin;
    final DateTime orderTime = widget.controller.orderTime;
    //final String image = "";
    return FlexibleSpaceBar(
      centerTitle: true,
      background: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  NetworkImageWidget(
                    url: "https://mallplusmm.com/storage/restaurants/sm/$image",
                    sizeHeight: 161,
                    sizeWidth: double.infinity,
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: widget.controller.preOrderStatus
                                      ? AppColors.primary
                                      : AppColors.greenDark2,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                widget.controller.preOrderStatus
                                    ? "Close Now"
                                    : "Open Now",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                      color: AppColors.primaryLight9,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 24,
                          width: 24,
                          child:
                              SvgPicture.asset("assets/Icons/location-03.svg")),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$distance Km ",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          // color: AppColors.secondary,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryLight9,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 24,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$rating ",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          // color: AppColors.secondary,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'assets/Icons/clock.svg',
                    colorFilter: const ColorFilter.mode(
                        AppColors.green, BlendMode.srcIn),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Delivery $deliveryMin min",
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.greenDark2,
                      borderRadius: BorderRadius.circular(5)),
                  child: Obx(
                    () => Text(
                      "${DateFormat("dd/MM/y - hh:mm a").format(widget.controller.orderTime)} : ${DateFormat("hh:mm a").format(widget.controller.orderTime.copyWith(minute: 30))}",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      const PreOrderBottomSheetWidget(),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColors.greenDark2,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Pre Order",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  PreferredSize _tabBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(-26),
      child: Container(
        height: 30,
        color: Colors.white,
        child: TabBar(
          //controller: ,
          dividerHeight: 0,
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.primary,

          indicator: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10)),
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          tabs: List.generate(widget.controller.restaurantDetail.menus.length,
              (index) {
            final menu = widget.controller.restaurantDetail.menus[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primary,
                  )),
              child: Center(
                child: Text(menu.name),
              ),
            );
          }),
          onTap: (index) {
            VerticalScrollableTabBarStatus.setIndex(index);
          },
        ),
      ),
    );
  }

  _tabBarViewSection(Menus menu) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              menu.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: menu.menuItems.length,

            //cacheExtent: 1000,
            itemBuilder: (context, index) {
              final menuItem = menu.menuItems[index];

              return InkWell(
                onTap: () {
                  if (widget.controller.preOrderStatus &&
                      widget.controller.orderTime == null) {
                    Get.bottomSheet(
                      const PreOrderBottomSheetWidget(),
                    );
                    return;
                  }
                  AppRoutes.toFoodDetailPage(
                      item: menuItem,
                      restaurantDetailModel: widget.controller.restaurantDetail,
                      orderTime: widget.controller.orderTime);
                },
                borderRadius: BorderRadius.circular(15),
                child: _menuItemWidget(
                    name: menuItem.name,
                    image: menuItem.imageSrc ?? "",
                    description: menuItem.description ?? "",
                    price: menuItem.price,
                    discount: menuItem.discount),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _menuItemWidget(
      {required String name,
      required String image,
      required String description,
      required num price,
      required num discount}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(246, 41, 41, 0.10),
            blurRadius: 30,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          NetworkImageWidget(
            url: "https://mallplusmm.com/storage/restaurants/sm/$image",
            sizeWidth: 82,
            sizeHeight: 82,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: SizedBox(
            height: 82,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 22,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (discount != 0)
                            Row(
                              children: [
                                Text(
                                  (price - discount).toString(),
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.neutral7,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          Text(
                            "$price ks",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 14,
                            height: 14,
                            child: SvgPicture.asset(
                              'assets/Icons/access_time.svg',
                              colorFilter: const ColorFilter.mode(
                                  AppColors.green, BlendMode.srcIn),
                            ),
                          ),
                          Text(
                            "35 min",
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: AppColors.green),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Expanded(
                    child: Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
