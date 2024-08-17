import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/user_address_model.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/controller/auth_controller.dart';
import 'package:mall_plus_new_customer_app/models/home_data_model.dart';
import 'package:mall_plus_new_customer_app/models/current_locattion_model.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/order_controlller.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/home/controller/home_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/order/controller/order_history_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/resturant/controller/resturant_controller.dart';
import 'package:mall_plus_new_customer_app/services/auth_service.dart';
import 'package:mall_plus_new_customer_app/services/main_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_env.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/setting_model.dart';
import '../../../models/version_model.dart';
import '../views/widget/my_dialog.dart';

abstract class MainController {
  int get currentIndex;
  UserAddress get nearestAddress;
  List<UserAddress> get addresses;
  Version get version;
  CurrentLocation get position;
  void onPageChange(int index);
  void setnearestAddress(UserAddress address);
  void setAddresses(List<UserAddress> addressess);
  void onLocationChange(UserAddress selected);
  Future<void> onRefresh();
}

class MainControllerImpl extends GetxController implements MainController {
  final _currentIndex = 0.obs;

  final _version = Version(status: true, message: '').obs;
  final _position = CurrentLocation().obs;

  final _nearestAddress = UserAddress().obs;

  final _addresses = <UserAddress>[].obs;

  FlutterSecureStorage storage = const FlutterSecureStorage();

  late final AuthService _auth;

  late final MainService _mainservice;

  late final HomeController _homeController;
  late final AuthController _authController;
  late final ResturantController _restaurantController;

  //checking version
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _auth = AuthServiceImpl();
    _mainservice = MainServiceImpl();
  }

  @override
  void onReady() async {
    _homeController = Get.find();
    _restaurantController = Get.find();
    _authController = Get.find();
    await _authController.checkisAuth();
    await _getlocation();
    await checkVersion();

    if (!version.version_pass! && version.is_force_update!) {
      print("version not pass and force update");
      await showForceUpdateDialog(version.setting!);
    } else if (!version.version_pass! && !version.is_force_update!) {
      print('version not pass and not force update');
      await showUpdateCanPassDialog(version.setting!);
    }
    super.onReady();
  }

  @override
  CurrentLocation get position => _position.value;

  @override
  UserAddress get nearestAddress => _nearestAddress.value;

  // Future<void> _fetchHomeData() async {
  //   try {
  //     HomeData result = await _mainservice.gethomedata(position);
  //     _nearestAddress(result.userInfo?.nearestAddress);
  //     _mainservice.setLocation(_nearestAddress.value);
  //     _addresses(result.userInfo!.addresses);
  //   } finally {}
  // }

  Future<void> _getlocation() async {
    double latitude = 0.0;
    double longitude = 0.0;
    Position pos;
    String userId = (await storage.read(key: 'userId')) ?? '0';
    try {
      bool isLocationServiceEnabled =
          await Geolocator.isLocationServiceEnabled();
      if (isLocationServiceEnabled) {
        print("location service enabled");
        pos = await Get.find<AuthController>().determinePosition();
        print(pos.latitude);
        latitude = pos.latitude;
        longitude = pos.longitude;
      } else {
        latitude = nearestAddress.latitude ?? AppEnv.default_latitude;
        longitude = nearestAddress.longitude ?? AppEnv.default_longitude;
      }

      CurrentLocation location = CurrentLocation(
          userId: int.parse(userId),
          latitude: await latitude,
          longitude: await longitude);
      _position(location);
      UserAddress _address = nearestAddress.copyWith(
        latitude: position.latitude ?? 0.0,
        longitude: position.longitude ?? 0.0,
      );
      _nearestAddress(_address);
    } catch (e) {
      print(e);
    }
  }

  Future<void> showForceUpdateDialog(Setting setting) async {
    await Get.dialog(
      MyDialog(
        title: "Update Required",
        content: "Please update to the latest version to continue.",
        cancelButtonName: "Cancel",
        cancelOnPressed: () {
          Get.back(); // Close the dialog
        },
        yesButtonName: "Update",
        onPressed: () {
          String link = '';
          if (setting.app_platform == 'ANDROID') {
            link = setting.android_link;
          } else if (setting.app_platform == 'IOS') {
            link = setting.ios_link;
          } else {
            link = setting.android_link;
          }
          _gotoDownloadLink(link);
        },
      ),
    );
  }

  Future<void> showUpdateCanPassDialog(Setting setting) async {
    await Get.dialog(MyDialog(
      title: "New Version Available",
      content:
          "There is a newer version available for download! Please update now.",
      cancelButtonName: "Remind Later",
      cancelOnPressed: () {
        Get.back();
        // _checkPlayStoreService();
      },
      yesButtonName: "Update",
      onPressed: () {
        String link = '';
        if (setting.app_platform == 'ANDROID') {
          link = setting.android_link;
        } else if (setting.app_platform == 'IOS') {
          link = setting.ios_link;
        } else {
          link = setting.android_link;
        }
        _gotoDownloadLink(link);
      },
    ));
  }

  _gotoDownloadLink(String link) async {
    String url = "$link";
    await launch(url);
  }

  @override
  int get currentIndex => _currentIndex.value;

  @override
  void onPageChange(int index) {
    ResturantController resturantController = Get.find();
    OrderHistoryController orderHistoryController = Get.find();

    switch (index) {
      case 0:
        break;
      case 1:
        if (resturantController.restaurants.isEmpty) {
          resturantController.getRestaurants();
        }
        break;
      case 3:
        if (orderHistoryController.orderHistories.isEmpty) {
          orderHistoryController.getOrderHistories();
        }
      default:
    }

    _currentIndex.value = index;
  }

  @override
  void onLocationChange(UserAddress selected) {
    _nearestAddress.value = selected;
    _mainservice.setLocation(selected);
  }

  //to check version
  @override
  Version get version => _version.value;

  Future<void> checkVersion() async {
    var v = await _auth.versionChecker();
    _version(v);
  }

  @override
  // TODO: implement addresses
  List<UserAddress> get addresses => _addresses.value;

  @override
  Future<void> onRefresh() async {
    await _homeController.onRefresh();
    await _restaurantController.onRefresh();
  }

  @override
  void setAddresses(List<UserAddress> addressess) {
    _addresses(addressess);
  }

  @override
  void setnearestAddress(UserAddress address) {
    _nearestAddress(address);
  }
}
