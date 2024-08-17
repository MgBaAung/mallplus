import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/auth_result_model.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/controller/notification_controller.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/view/widget/notification_dialog.dart';
import 'package:mall_plus_new_customer_app/services/local_storage_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';
import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';
import 'package:notification_permissions/notification_permissions.dart';

abstract class AuthController {
  bool get isLoading;
  bool get isAuth;
  AuthResult get result;
  void setAuth(AuthResult result);
  void setisAuth(bool status);
  Future<void> checkisAuth();
  Future<Position> determinePosition();
//   bool get isButtonDisabled;
//   String get message;

//   void doLogin(String phone);
}

class AuthControllerImpl extends GetxController implements AuthController {
  final _isAuth = false.obs;
  final _isLoading = false.obs;
  static const String _kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String _kPermissionDeniedMessage = 'Permission denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String _kPermissionGrantedMessage = 'Permission granted.';
  final _auth_result = AuthResult(status: false, code: "200", message: "is not authenticated").obs;

  var title = "Notification Permission";
  var description =
      "Order အမှာစာ Status ပေးပို့ရန် Notification Permission အားဖွင့်ထားရန်လိုအပ်ပါသည်။";

  var permGranted = "granted";
  var permDenied = "denied";
  var permUnknown = "unknown";
  var permProvisional = "provisional";
  late Future<String> permissionStatusFuture;
  @override
  bool get isLoading => _isLoading.value;

  @override
  bool get isAuth => _isAuth.value;

  FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  void onInit() async {
    await determinePosition();

    await _firebaseInit();
    super.onInit();
  }


  @override
  void onReady() async {
    // TODO: implement onReady
    // TODO: implement onInit

    super.onReady();
  }
  @override
  setisAuth(bool status) {
    try {
      _isLoading(true);
      _isAuth(status);
    } finally {
      _isLoading(false);
    }
  }

  _firebaseInit() async {
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        if (message.data.containsKey('is_redirect')) {
          // Get.to(NotificationPage(int.parse(message.data['noti_id']),
          //     int.parse(message.data['promotion_id'])));
        }
        if (message.data.containsKey('id')) {
          //  if (event.from.contains("fm-user")) {
          // if (masterController.isAuth.value == true) {
          //   masterController.fetchVouchers();
          // }
        }
      }
    });
  }

  @override
  Future<void> checkisAuth() async {
    // TODO: implement checkisAuth
    var is_contain = await LocalStorageServie.iskeyexists(TOKEN);
    print('is contain');
    print(isAuth);
    if (is_contain) {
      setisAuth(true);
    } else {
      setisAuth(false);
      //AppRoutes.offalllogin();
    }
  }

  @override
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("^^^^^^^^^^^^^^^^^^^^^^^^^^ $serviceEnabled");

    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(_kPermissionDeniedMessage);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(_kPermissionDeniedForeverMessage);
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  AuthResult get result => _auth_result.value;

  @override
  void setAuth(AuthResult result) {
    _auth_result.value = result;
  }
}
