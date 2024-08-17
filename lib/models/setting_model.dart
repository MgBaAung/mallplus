class Setting {
  final int id;
  final String app_name;
  final String description;
  final int order_service;
  final int busy_service;
  final int busy_min;
  final String message;
  final int max_order_count;
  final int max_delivery_distance;
  final int save_keyword;
  final int first_order_free_delivery;
  final int happy_hour;
  final String app_platform;
  final int app_force_update;
  final String app_version;
  final String android_link;
  final String ios_link;
  final String web_link;
  final int active;
  final int has_promotion;

  Setting({
    required this.id,
    required this.app_name,
    required this.description,
    required this.order_service,
    required this.busy_service,
    required this.busy_min,
    required this.message,
    required this.max_order_count,
    required this.max_delivery_distance,
    required this.save_keyword,
    required this.first_order_free_delivery,
    required this.happy_hour,
    required this.app_platform,
    required this.app_force_update,
    required this.app_version,
    required this.android_link,
    required this.ios_link,
    required this.web_link,
    required this.active,
    required this.has_promotion,
  });

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
      id: json['id'],
      app_name: json['app_name'],
      description: json['description'],
      order_service: json['order_service'],
      busy_service: json['busy_service'],
      busy_min: json['busy_min'],
      message: json['message'],
      max_order_count: json['max_order_count'],
      max_delivery_distance: json['max_delivery_distance'],
      save_keyword: json['save_keyword'],
      first_order_free_delivery: json['first_order_free_delivery'],
      happy_hour: json['happy_hour'],
      app_platform: json['app_platform'],
      app_force_update: json['app_force_update'],
      app_version: json['app_version'],
      android_link: json['android_link'],
      ios_link: json['ios_link'],
      web_link: json['web_link'],
      active: json['active'],
      has_promotion: json['has_promotion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'app_name': app_name,
      'description': description,
      'order_service': order_service,
      'busy_service': busy_service,
      'busy_min': busy_min,
      'message': message,
      'max_order_count': max_order_count,
      'max_delivery_distance': max_delivery_distance,
      'save_keyword': save_keyword,
      'first_order_free_delivery': first_order_free_delivery,
      'happy_hour': happy_hour,
      'app_platform': app_platform,
      'app_force_update': app_force_update,
      'app_version': app_version,
      'android_link': android_link,
      'ios_link': ios_link,
      'web_link': web_link,
      'active': active,
      'has_promotion': has_promotion,
    };
  }

  Setting copyWith({
    int? id,
    String? app_name,
    String? description,
    int? order_service,
    int? busy_service,
    int? busy_min,
    String? message,
    int? max_order_count,
    int? max_delivery_distance,
    int? save_keyword,
    int? first_order_free_delivery,
    int? happy_hour,
    String? app_platform,
    int? app_force_update,
    String? app_version,
    String? android_link,
    String? ios_link,
    String? web_link,
    int? active,
    int? has_promotion,
  }) {
    return Setting(
      id: id ?? this.id,
      app_name: app_name ?? this.app_name,
      description: description ?? this.description,
      order_service: order_service ?? this.order_service,
      busy_service: busy_service ?? this.busy_service,
      busy_min: busy_min ?? this.busy_min,
      message: message ?? this.message,
      max_order_count: max_order_count ?? this.max_order_count,
      max_delivery_distance:
          max_delivery_distance ?? this.max_delivery_distance,
      save_keyword: save_keyword ?? this.save_keyword,
      first_order_free_delivery:
          first_order_free_delivery ?? this.first_order_free_delivery,
      happy_hour: happy_hour ?? this.happy_hour,
      app_platform: app_platform ?? this.app_platform,
      app_force_update: app_force_update ?? this.app_force_update,
      app_version: app_version ?? this.app_version,
      android_link: android_link ?? this.android_link,
      ios_link: ios_link ?? this.ios_link,
      web_link: web_link ?? this.web_link,
      active: active ?? this.active,
      has_promotion: has_promotion ?? this.has_promotion,
    );
  }

  @override
  List<Object> get props => [
        id,
        app_name,
        description,
        order_service,
        busy_service,
        busy_min,
        message,
        max_order_count,
        max_delivery_distance,
        save_keyword,
        first_order_free_delivery,
        happy_hour,
        app_force_update,
        app_version,
        android_link,
        ios_link,
        web_link,
        active,
        has_promotion,
      ];

  @override
  String toString() => 'Setting { id: $id, app_name: $app_name }';
}
