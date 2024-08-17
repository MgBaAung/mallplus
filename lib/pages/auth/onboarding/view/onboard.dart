import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mall_plus_new_customer_app/pages/auth/login/view/screen/login_screen.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/controller/auth_controller.dart';
import 'package:mall_plus_new_customer_app/pages/main/main_page.dart';

class OnboardPage extends GetView {
  OnboardPage({super.key});
  var _auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
