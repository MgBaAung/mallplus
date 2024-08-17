import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/user_address_model.dart';
import 'package:mall_plus_new_customer_app/pages/main/controllers/main_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/bottomsheet/location_bottom_sheet_view.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/cuisine/cuisine_screen.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/home/home_screen.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/order/order_screen.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/resturant/resturant_screen.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/setting/setting_screen.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';

import '../checkout/controllers/cart_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  void _showCustomBottomSheet2() {
    Get.bottomSheet(
        isScrollControlled: true,
        Obx(() => LocationBottomSheet(
              addresses: controller.addresses,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  _showCustomBottomSheet2();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 35),
                      width: 230,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //assets/Icons/location-03.svg
                          AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            child: SvgPicture.asset(
                              'assets/Icons/location-03.svg',
                              colorFilter: ColorFilter.mode(
                                  AppColors.primary, BlendMode.srcIn),
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Delivery To : ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                              Obx(() => Container(
                                    width: 170,
                                    child: Text(
                                      controller.nearestAddress.title ??
                                          'loading...',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  child: SizedBox(
                    width: 30,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/Icons/noti.svg',
                          colorFilter: ColorFilter.mode(
                              AppColors.neutral1, BlendMode.srcIn),
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
                                "0",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              GetBuilder<CartController>(
                builder: (cartController) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Obx(
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
                    ),
                  );
                },
              )
              // Padding(
              //   padding: const EdgeInsets.only(right: 20),
              //   child: IconButton(
              //     onPressed: () {
              //       AppRoutes.toCartView();
              //     },
              //     icon: AnimatedContainer(
              //       duration: Duration(milliseconds: 400),
              //       child: SvgPicture.asset(
              //         'assets/Icons/cart.svg',
              //         colorFilter: ColorFilter.mode(AppColors.neutral1, BlendMode.srcIn),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        body: Obx(() {
          return IndexedStack(
            index: controller.currentIndex,
            children: const [
              HomeScreen(),
              ResturantScreen(),
              CuisineScreen(),
              OrderScreen(),
              SettingScreen(),
            ],
          );
        }

            // controller.isLoading
            //     ? const Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     :

            ),
        bottomNavigationBar: Obx(
          () => Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: AppColors.primaryLight9,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 5,
              onTap: (index) => controller.onPageChange(index),
              unselectedFontSize: 10,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedLabelStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                  height: 2),
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.neutral9,
                  height: 2),
              currentIndex: controller.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/Icons/navs/home-icon.svg',
                      colorFilter: ColorFilter.mode(
                          controller.currentIndex == 0
                              ? AppColors.primary
                              : AppColors.neutral9,
                          BlendMode.srcIn)),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/Icons/navs/restaurant-icon.svg',
                      colorFilter: ColorFilter.mode(
                          controller.currentIndex == 1
                              ? AppColors.primary
                              : AppColors.neutral9,
                          BlendMode.srcIn),
                    ),
                    label: "Restaurant"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                        'assets/Icons/navs/category-icon.svg',
                        colorFilter: ColorFilter.mode(
                            controller.currentIndex == 2
                                ? AppColors.primary
                                : AppColors.neutral9,
                            BlendMode.srcIn)),
                    label: "Cuisine"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/Icons/navs/order-icon.svg',
                        colorFilter: ColorFilter.mode(
                            controller.currentIndex == 3
                                ? AppColors.primary
                                : AppColors.neutral9,
                            BlendMode.srcIn)),
                    label: "Order"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/Icons/navs/setting-icon.svg',
                        colorFilter: ColorFilter.mode(
                            controller.currentIndex == 4
                                ? AppColors.primary
                                : AppColors.neutral9,
                            BlendMode.srcIn)),
                    label: "Setting"),
              ],
            ),
          ),
        ));
  }
}
