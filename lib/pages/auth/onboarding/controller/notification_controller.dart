import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/controller/auth_controller.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/view/widget/notification_dialog.dart';
import 'package:notification_permissions/notification_permissions.dart';

import '../../../../utils/constants/app_route.dart';

abstract class NotificationPermissionController {
  String get permissionStatus;
  bool get dialogDismissed;
  void setdialogdismissed(bool dismissed);
  Future<String> checkPermissionStatus();
  void requestNotificationPermission();
}

class NotificationPermissionControllerImpl extends GetxController implements NotificationPermissionController {
  var permGranted = "granted";
  var permDenied = "denied";
  var permUnknown = "unknown";
  var permProvisional = "provisional";
  var _permissionStatus = "".obs;
  var _dialogDismissed = false.obs;

  var _authcontroller = Get.find<AuthController>();

  @override
  void onReady() async {
    // TODO: implement onReady
    // _dialogDismissed(false);
    _permissionStatus.value = await checkPermissionStatus();
    if (_permissionStatus.value == permDenied) {
      await _showDialog();
    } else {
      _authcontroller.checkisAuth();
      // _dialogDismissed(true);
      // if (_authcontroller) {
      //   // AppRoutes.offallMainPage();
      // } else {
      //   AppRoutes.offalllogin();
      // }
    }
    super.onReady();
  }

  @override
  void onInit() async {
    super.onInit();

  }



  Future<void> _showDialog() async {
    Get.dialog(const NotificationPermissionDialog(
      title: "Notification Permission",
      description: "Order အမှာစာ Status ပေးပို့ရန် Notification Permission အားဖွင့်ထားရန်လိုအပ်ပါသည်။",
    )).then((value) {
      _authcontroller.checkisAuth();
    });
  }

  @override
  void requestNotificationPermission() async {
    await NotificationPermissions.requestNotificationPermissions(openSettings: true, iosSettings: const NotificationSettingsIos(sound: true, badge: true, alert: true)).then((value) {
      checkPermissionStatus();
      setdialogdismissed(true);
      Get.back();
    });
  }

  @override
  // TODO: implement permissionStatus
  String get permissionStatus => _permissionStatus.value;

  @override
  Future<String> checkPermissionStatus() async {
    return NotificationPermissions.getNotificationPermissionStatus().then((status) {
      switch (status) {
        case PermissionStatus.denied:
          return permDenied;
        case PermissionStatus.granted:
          return permGranted;
        //  return Get.offAll(HomeControlPage());
        case PermissionStatus.unknown:
          return permUnknown;
        case PermissionStatus.provisional:
          return permProvisional;
        default:
          return permDenied;
      }
    });
  }

  @override
  // TODO: implement dialogDismissed
  bool get dialogDismissed => _dialogDismissed.value;

  @override
  void setdialogdismissed(bool dismissed) {
    _dialogDismissed(dismissed);
  }
}
