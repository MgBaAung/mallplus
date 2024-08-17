import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mall_plus_new_customer_app/models/auth_result_model.dart';

import 'package:mall_plus_new_customer_app/services/api_service.dart';
import 'package:mall_plus_new_customer_app/services/local_storage_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_env.dart';
import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';
import 'package:mall_plus_new_customer_app/utils/constants/end_points.dart';

import '../models/http_ressponse_model.dart';
import '../models/version_model.dart';

abstract class AuthService {
  Future<AuthResult> authenticate({required String name, required String phone});
  Future<Version> versionChecker();
  Future<AuthResult> verifyOtp(int id, String phone, String otpCode, {String? firebaseToken});
}

class AuthServiceImpl implements AuthService {
  static final String _url = AppEnv.server_url;
  final _api = ApiService();

  Future<void> test() async {}

  @override
  Future<AuthResult> authenticate({required String name, required String phone}) async {
    var body = {'phone': '09${phone.trim()}', 'name': name.toString()};
    HttpResponseModel response = await _api.postRequest(url: EndPoints.requestOtpRegister, body: body);
    if (response.isSuceess) {
      final result = AuthResult.fromJson(response.data);
      return result;
    }
    return AuthResult(status: response.isSuceess, code: '401', message: response.message);
  }

  @override
  Future<Version> versionChecker() async {
    int versionNo = AppEnv.version_no;
    String appPlatform = 'ANDROID';
    if (Platform.isAndroid) {
      appPlatform = 'ANDROID';
    } else if (Platform.isIOS) {
      appPlatform = 'IOS';
    }
    var body = {'platform': appPlatform, 'version_no': versionNo.toString()};
    HttpResponseModel response = await _api.postRequest(url: EndPoints.requestcheckappversion, body: body);
    if (response.isSuceess) {
      final result = Version.fromJson(response.data);
      return result;
    }
    return Version(status: response.isSuceess, message: response.message);
  }

  @override
  Future<AuthResult> verifyOtp(int id, String phone, String otpCode, {String? firebaseToken}) async {
    var body = {'id': id.toString(), 'phone': phone.trim(), 'otp_code': otpCode.trim(), 'firebase_token': firebaseToken ?? ''};
    HttpResponseModel response = await _api.postRequest(url:  EndPoints.requesttoverifyOtp, body: body);
    if (response.isSuceess) {
      final result = AuthResult.fromJson(response.data);
      LocalStorageServie.setData(TOKEN, result.token!);
      LocalStorageServie.setData(USER, jsonEncode(result.user!));
      FirebaseMessaging.instance.subscribeToTopic('fm-user-${result.user?.id}');
      return result;
    }
    return AuthResult(status: response.isSuceess, code: '401', message: response.message);
  }
}
