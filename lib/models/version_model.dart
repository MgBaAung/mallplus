import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../models/setting_model.dart';

class Version extends Equatable {
  bool status;
  String message;
  int? current_version;
  int? latest_version;
  bool? version_pass;
  bool? is_force_update;
  String? platform;
  Setting? setting;

  Version({
    required this.status,
    required this.message,
    this.current_version,
    this.latest_version,
    this.version_pass,
    this.is_force_update,
    this.platform,
    this.setting,
  });

  factory Version.fromJson(Map<String, dynamic> json) {
    return Version(
      status: json['status'],
      version_pass: json['version_pass'],
      is_force_update: json['is_force_update'],
      current_version: json['current_version'],
      latest_version: json['latest_version'],
      platform: json['platform'],
      message: json['message'],
      setting: json['setting'] != null ? Setting.fromJson(json['setting']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['version_pass'] = this.version_pass;
    data['is_force_update'] = this.is_force_update;
    data['current_version'] = this.current_version;
    data['latest_version'] = this.latest_version;
    data['platform'] = this.platform;
    data['message'] = this.message;
    if (this.setting != null) {
      data['setting'] = this.setting!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [
        status,
        version_pass,
        is_force_update,
        current_version,
        latest_version,
        platform,
        message,
        setting,
      ];
}
