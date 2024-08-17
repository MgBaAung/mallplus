import 'package:mall_plus_new_customer_app/models/setting_model.dart';
import 'package:mall_plus_new_customer_app/models/user_model.dart';

class AuthResult {
  bool status;
  String code;
  String message;

  String? token;
  bool? appValid;
  String? appLatestVersion;
  User? user;
  Setting? setting;
  String? iosVersion;
  String? androidVersion;

  AuthResult(
      {required this.status,
      required this.code,
      required this.message,
      this.token,
      this.appValid,
      this.appLatestVersion,
      this.user,
      this.setting,
      this.iosVersion,
      this.androidVersion});

  factory AuthResult.fromJson(Map<String, dynamic> json) {
    return AuthResult(
      status: json['status'],
      code: json['code']??'',
      message: json['message'],
      token: json['token'],
      appValid: json['appValid'],
      appLatestVersion: json['appLatestVersion'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      setting:
          json['setting'] != null ? Setting.fromJson(json['setting']) : null,
      iosVersion: json['iosVersion'],
      androidVersion: json['androidVersion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'code': code,
      'message': message,
      'token': token,
      'appValid': appValid,
      'appLatestVersion': appLatestVersion,
      'user': user != null ? user!.toJson() : null,
      'setting': setting != null ? setting!.toJson() : null,
      'iosVersion': iosVersion,
      'androidVersion': androidVersion,
    };
  }

  @override
  List<Object> get props => [
        status,
        code,
        message,
        token!,
        appValid!,
        appLatestVersion!,
        user!,
        setting!,
        iosVersion!,
        androidVersion!
      ];
}
