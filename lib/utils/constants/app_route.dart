import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/main.dart';
import 'package:mall_plus_new_customer_app/models/resturant_detail_model.dart';
import 'package:mall_plus_new_customer_app/pages/auth/login/bindings/login_bindings.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/bindings/onboarding_bindings.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/view/onboard.dart';
import 'package:mall_plus_new_customer_app/pages/auth/otp/bindings/otp_bindings.dart';
import 'package:mall_plus_new_customer_app/models/user_model.dart';
import 'package:mall_plus_new_customer_app/pages/auth/login/view/screen/login_screen.dart';
import 'package:mall_plus_new_customer_app/pages/auth/otp/view/screen/otp_screen.dart';
import 'package:mall_plus_new_customer_app/pages/auth/register/bindings/register_bindings.dart';
import 'package:mall_plus_new_customer_app/pages/auth/register/view/screen/register_screen.dart';
import 'package:mall_plus_new_customer_app/pages/coupon/bindings/coupon_page_binding.dart';
import 'package:mall_plus_new_customer_app/pages/coupon/coupon_page.dart';
import 'package:mall_plus_new_customer_app/pages/filteredrestaurant/binding/filtered_restaurant_binding.dart';
import 'package:mall_plus_new_customer_app/pages/filteredrestaurant/filtered_restaurant_page.dart';
import 'package:mall_plus_new_customer_app/pages/location/binding/location_picker_page_binding.dart';
import 'package:mall_plus_new_customer_app/pages/location/location_picker_page.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/bindings/order_place_page_binding.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/bindings/payment_page_binding.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/pages/cart_list/cart_list_page.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/pages/delivery_address/bindings/delivery_address_page_binding.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/pages/delivery_address/delivery_address_page.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/pages/delivery_address/map_place_picker.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/pages/order_place/order_place_page.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/pages/payment/payment_page.dart';
import 'package:mall_plus_new_customer_app/pages/food_detail/bindings/food_detail_page_binding.dart';
import 'package:mall_plus_new_customer_app/pages/main/bindings/main_page_binding.dart';
import 'package:mall_plus_new_customer_app/pages/main/main_page.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/setting/pages/about_page.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/setting/pages/customer_support_page.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/setting/pages/profile/controller/profile_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/setting/pages/profile/profile_page.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/setting/pages/term_condition_page.dart';
import 'package:mall_plus_new_customer_app/pages/order_coupon/controller/order_coupon_controller.dart';
import 'package:mall_plus_new_customer_app/pages/order_coupon/order_coupon_page.dart';
import 'package:mall_plus_new_customer_app/pages/order_history_detail/order_history_detail_page.dart';
import 'package:mall_plus_new_customer_app/pages/restaurant_detail/bindings/restaurant_detail_page_binding.dart';
import 'package:mall_plus_new_customer_app/pages/restaurant_detail/restaurant_detail_page.dart';
import 'package:mall_plus_new_customer_app/pages/food_detail/food_detail_page.dart';
import 'package:mall_plus_new_customer_app/pages/motezaytan/binding/motezaytan_page_binding.dart';
import 'package:mall_plus_new_customer_app/pages/motezaytan/motezaytan_page.dart';
import 'package:mall_plus_new_customer_app/pages/promotion/binding/promotion_page_binding.dart';
import 'package:mall_plus_new_customer_app/pages/promotion/promotion_page.dart';

import '../../models/order_history_model.dart';

class AppRoutes {
  AppRoutes._();
  static const String mainPage = "/mainPage";
  static const String loginPage = "/loginPage";
  static const String registerPage = "/registerPage";
  static const String otpPage = "/otpPage";
  static const String onboarding = "/onboarding";
  static const String restaurantDetailPage = "/restaurant_detail_page";
  static const String foodDetailPage = "/restaurant_menu_item_page";
  static const String cartViewPage = "/cart_view_page";
  static const String deliveryAddressPage = "/delivery_address_page";
  static const String mapPlacePickerPage = "/map_place_picker_page";
  static const String orderPlacePage = "/order_place_page";
  static const String paymentPage = "/payment_page";
  static const String coupon = "/coupon";
  static const String promotion = "/promotion";
  static const String motezaytan = "/motezaytan";
  static const String filteredrestaurants = "/filtered_restaurants";
  static const String locationpicker = "/location_picker";
  static const String orderHistoryDetail = "/order_history_detail";
  static const String about = "/about";
  static const String termCondition = "/term_condition";
  static const String customerSupport = "/customer_support";
  static const String profilePage = "/profile_page";
  static const String orderCouponPage = "/order_coupon_page";

  static void offallMainPage() {
    Get.offAllNamed(mainPage);
  }

  static void toMainPage() {
    Get.toNamed(mainPage);
  }

  static void offalllogin() {
    Get.offAllNamed(loginPage);
  }

  static void toregister() {
    Get.toNamed(registerPage);
  }

  static void toPromotion({required int id}) {
    Get.toNamed(promotion, arguments: {"id": id});
  }

  static void toCoupon() {
    Get.toNamed(coupon);
  }

  static void tomotezaytan() {
    Get.toNamed(motezaytan);
  }

  static void offfilteredrestaurant(
      {required int menu_id, required String menu}) {
    Get.toNamed(filteredrestaurants,
        arguments: {"menu_id": menu_id, "menu": menu});
  }

  static void toOtpPage({required int id, required String phone}) {
    Get.toNamed(otpPage, arguments: {"id": id, "phone": phone});
  }

  static void toRestaurantDetailPage(
      {required int id, required bool preOrderStatus}) {
    Get.toNamed(restaurantDetailPage,
        arguments: {"id": id, "pre_order_status": preOrderStatus});
  }

  static void toFoodDetailPage({
    required MenuItems item,
    required RestaurantDetailModel restaurantDetailModel,
    required DateTime orderTime,
  }) {
    Get.toNamed(foodDetailPage, arguments: {
      "item": item,
      "restaurantDetailModel": restaurantDetailModel,
      "pre_order_time": orderTime
    });
  }

  static void toCartView() {
    Get.toNamed(
      cartViewPage,
    );
  }

  static void toOrderCoupon() {
    Get.toNamed(
      orderCouponPage,
    );
  }

  static void toDeliveryAddressPage() {
    Get.toNamed(
      deliveryAddressPage,
    );
  }

  static void toMapPlacePicker() {
    Get.toNamed(
      mapPlacePickerPage,
    );
  }

  static void toLocationPlacePicker({required String action}) {
    Get.toNamed(locationpicker, arguments: {'action': action});
  }

  static void toOrderPlacePage({
    MenuItems? item,
    Restaurant? restaurant,
    DateTime? orderTime,
  }) {
    Get.toNamed(orderPlacePage, arguments: {
      "item": item,
      "restaurant": restaurant,
      "orderTime": orderTime
    });
  }

  static void toPaymentPage({required int voucherId}) {
    Get.offNamedUntil(paymentPage, (route) => route.settings.name == mainPage,
        arguments: {"voucher_id": voucherId});
  }

  static void toOrderHistoryDetailPage(OrderHistoryModel order) {
    Get.toNamed(orderHistoryDetail, arguments: {"order": order});
  }

  static void back() {
    Get.back();
  }
}

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.mainPage,
      page: () => const MainPage(),
      binding: MainPageBinding(),
    ),
    // GetPage(
    //     name: AppRoutes.loginPage,
    //     page: () => Login(),
    //     binding: LoginBindings()),
    GetPage(
        name: AppRoutes.registerPage,
        page: () => Register(),
        binding: RegisterBindings()),
    GetPage(
        name: AppRoutes.otpPage, page: () => OtpPage(), binding: OtpBindings()),
    GetPage(
        name: AppRoutes.onboarding,
        page: () => OnboardPage(),
        binding: OnBoardBindings()),
    GetPage(
        name: AppRoutes.coupon,
        page: () => CouponPage(),
        binding: CouponPageBinding()),
    GetPage(
        name: AppRoutes.promotion,
        page: () => PromotionPage(),
        binding: PromotionPageBinding()),
    GetPage(
        name: AppRoutes.motezaytan,
        page: () => MoteZayTanPage(),
        binding: MoteZayTanPageBinding()),
    GetPage(
        name: AppRoutes.filteredrestaurants,
        page: () => FilteredRestaurantsPage(),
        binding: FilteredRestaurantPageBinding()),
    GetPage(
        name: AppRoutes.locationpicker,
        page: () => LocationPickerPage(),
        binding: LocationPickerPageBinding()),
    GetPage(
      name: AppRoutes.restaurantDetailPage,
      page: () => const RestaurantDetailPage(),
      binding: RestaurantDetailPageBinding(),
    ),
    GetPage(
      name: AppRoutes.foodDetailPage,
      page: () => const FoodDetailPage(),
      binding: FoodDetailPageBinding(),
    ),
    GetPage(
      name: AppRoutes.cartViewPage,
      page: () => const CatListPage(),
    ),
    GetPage(
      name: AppRoutes.deliveryAddressPage,
      page: () => const DeliveryAddressPage(),
      binding: DeliveryAddressPageBinding(),
    ),
    GetPage(
      name: AppRoutes.mapPlacePickerPage,
      page: () => const MapPlacePicker(),
    ),
    GetPage(
        name: AppRoutes.orderPlacePage,
        page: () => const OrderPlacePage(),
        binding: OrderPlacePageBinding()),
    GetPage(
      name: AppRoutes.paymentPage,
      page: () => const PaymentPage(),
      binding: PaymentPageBinding(),
    ),
    GetPage(
      name: AppRoutes.orderHistoryDetail,
      page: () => const OrderHistoryDetailPage(),
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutPage(),
    ),
    GetPage(
      name: AppRoutes.termCondition,
      page: () => const TermConditionPage(),
    ),
    GetPage(
      name: AppRoutes.customerSupport,
      page: () => const CustomerSupportPage(),
    ),
    GetPage(
        name: AppRoutes.profilePage,
        page: () => const ProfilePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ProfileController());
        })),
    GetPage(
        name: AppRoutes.orderCouponPage,
        page: () => const OrderCouponPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => OrderCouponController());
        })),
  ];
}
