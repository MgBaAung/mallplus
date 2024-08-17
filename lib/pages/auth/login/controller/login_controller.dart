import 'package:mall_plus_new_customer_app/pages/auth/login/view/screen/login_screen.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/controller/auth_controller.dart';
import 'package:mall_plus_new_customer_app/services/api_service.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/services/auth_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';

import '../../../../models/auth_result_model.dart';

abstract class LoginController {
  bool get isLoading;
  bool get isButtonDisabled;
  String get message;
  void doLogin(String phone);
}

class LoginControllerImpl extends GetxController implements LoginController {
  final _isLoading = false.obs;
  final _isButtonDisabled = false.obs;
  final _message = ''.obs;
  late AuthService _auth;
  late AuthController _authController;

  @override
  void onInit() {
    _auth = AuthServiceImpl();
    _authController = AuthControllerImpl();
    super.onInit();

  }


  @override
  void doLogin(String phone) async {
    try {
      _isButtonDisabled(true);
      _isLoading(true);

      //call api
      AuthResult result = await _auth.authenticate(name: "", phone: phone);

      if (result.status) {
        //api success
        _message('Successfully logged in');
        _authController.setAuth(result);
        AppRoutes.toOtpPage(id: result.user!.id!,phone: result.user!.phone!);
      } else {
        //api failed
        _message('Failed to login');
      }

      _isButtonDisabled(false);
    } catch (e) {
      //causing error
      _isButtonDisabled(false);
      _message('Failed to login');
    } finally {
      _isLoading(false);
      _isButtonDisabled(false);
    }
  }

  @override
  bool get isButtonDisabled => _isButtonDisabled.value;

  @override
  bool get isLoading => _isLoading.value;

  @override
  String get message => _message.value;
}
