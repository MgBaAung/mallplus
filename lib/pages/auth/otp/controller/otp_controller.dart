import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mall_plus_new_customer_app/pages/auth/login/controller/login_controller.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/controller/auth_controller.dart';
import 'package:mall_plus_new_customer_app/models/auth_result_model.dart';
import 'package:mall_plus_new_customer_app/models/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mall_plus_new_customer_app/services/auth_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';

abstract class OtpController {
  bool get isLoading;
  bool get isButtonDisabled;
  String get message;
  bool get expiredCode;
  int get seconds;
  String get time;
  User get user;

  Future<bool> doverifyotp(String otpCode);
  showWaningMessage(BuildContext context);
  String constructTime(int seconds);
}

class OtpControllerImpl extends GetxController implements OtpController {
  var _seconds = 0.obs;
  late Timer _timer;
  final _expiredCode = false.obs;
  final _isButtonDisabled = false.obs;
  final _isLoading = false.obs;
  final _message = ''.obs;
  var _user = User().obs;
  final _time = ''.obs;

  final AuthService _authservice = AuthServiceImpl();

  late AuthController _auth;

  late int id;
  late String phone;

  final storage = new FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    id= args['id'];
    phone = args['phone'];
    _auth = Get.find<AuthController>();
    var now = DateTime.now();
    var twoMinutes = now.add(Duration(minutes: 2)).difference(now);
    _seconds.value = twoMinutes.inSeconds;
    startTimer();
    // fetchOtpInfo(user);
  }

  // Future<bool> fetchOtpInfo(User item) async {
  //   try {
  //     _isLoading(true);
  //     _user(item);
  //   } finally {
  //     _isLoading(false);
  //     return true;
  //   }
  // }

  @override
  Future<bool> doverifyotp(String otpCode) async {
    try {
      _isButtonDisabled(true);
      _isLoading(true);

      final AuthResult result = await _authservice.verifyOtp(id, '09$phone', otpCode);
      if (result.status) {

      } else {
        // _message(result.message);
      }
      _auth.setisAuth(result.status);
      return result.status;
    } finally {
      _isButtonDisabled(true);
      _isLoading(false);
      cancelTimer();
    }
  }

  @override
  String constructTime(int seconds) {
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    _time("${formatTime(hour)}:${formatTime(minute)}:${formatTime(second)}");
    return "${formatTime(hour)}:${formatTime(minute)}:${formatTime(second)}";
  }

  @override
  showWaningMessage(BuildContext context) {
    Widget okButton = MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Colors.red,
      child: const Text(
        "OK",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Cannot Verify Identity"),
      content: Text(message ?? "The verification code you have entered is not valid."),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            okButton,
          ],
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // Digital formatting, converting 0-9 time to 00-09
  String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  void startTimer() {
    // Set 1 second callback
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      // Update interface
      // minus one second because it calls back once a second
      _seconds--;
      _seconds();
      constructTime(_seconds.value);
      if (seconds == 0) {
        // Countdown seconds 0, cancel timer
        _expiredCode(true);
        cancelTimer();
      }
    });
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  bool get isButtonDisabled => _isButtonDisabled.value;

  @override
  bool get isLoading => _isLoading.value;

  @override
  String get message => _message.value;

  @override
  bool get expiredCode => _expiredCode.value;

  @override
  int get seconds => _seconds.value;

  @override
  User get user => _user.value;

  @override
  String get time => _time.value;
}
