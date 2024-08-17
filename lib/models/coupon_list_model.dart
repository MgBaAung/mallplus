class CouponList {
  CouponList({this.coupons, this.count});

  List<Coupon>? coupons;
  int? count;

  factory CouponList.fromJson(Map<String, dynamic> json) => CouponList(
      // coupons: List<Coupon>.from(
      //     json["data"]["coupons"].map((x) => x.couponFromJson(x))),
      coupons: (json['data'] == null || json['data'] == []) ? [] : List<Coupon>.from(json['data'].map((x) => Coupon.fromJson(x))),
      count: 0);

  Map<String, dynamic> toJson() => {"results": List<int>.from(coupons!.map((x) => x)), "count": count};
}

class Coupon {
  final int? id;
  final bool? is_valid;
  final bool? is_coupon_pass;
  final String? messsage;
  final int? restaurant_id;
  final String? title;
  final String? code;
  final String? start_date;
  final String? end_date;
  final String? start_time;
  final String? end_time;
  final String? valid_till;
  final String? coupon_type;

  final int? offer_limit;

  final int? order_count_limit_per_coupon;
  final double? min_order_amount;
  final double? max_order_amount;
  final int? order_count_limit_per_user;
  final int? used_order_count;
  final int? discount_percent;
  final double? discount_amount;

  final int? used_count;
  final String? short_description;
  final String? long_description;
  final String? image;

  final int? status;
  final int? menu_item_id;

  final double? promotion_amount;
  final String? promotion_type;
  final List? except_restaurants;
  final String? calc_action;
  final List<CouponDetail>? children;
  final bool? is_show_promo;

  Coupon(
      {this.id,
      this.is_valid,
      this.is_coupon_pass,
      this.messsage,
      this.restaurant_id,
      this.title,
      this.code,
      this.start_date,
      this.end_date,
      this.start_time,
      this.end_time,
      this.valid_till,
      this.coupon_type,
      this.offer_limit,
      this.order_count_limit_per_coupon,
      this.min_order_amount,
      this.max_order_amount,
      this.order_count_limit_per_user,
      this.used_order_count,
      this.discount_percent,
      this.discount_amount,
      this.used_count,
      this.short_description,
      this.long_description,
      this.image,
      this.status,
      this.menu_item_id,
      this.promotion_amount,
      this.promotion_type,
      this.calc_action,
      this.children,
      this.except_restaurants,
      this.is_show_promo});

  Coupon copyWith(
      {int? id,
      bool? is_valid,
      bool? is_coupon_pass,
      String? message,
      int? restaurant_id,
      String? title,
      String? code,
      String? start_date,
      String? end_date,
      String? start_time,
      String? end_time,
      String? valid_till,
      String? coupon_type,
      int? offer_limit,
      int? order_count_limit_per_coupon,
      double? min_order_amount,
      double? max_order_amount,
      int? order_count_limit_per_user,
      int? used_order_count,
      int? discount_percent,
      double? discount_amount,
      int? used_count,
      String? short_description,
      String? long_description,
      String? image,
      int? status,
      int? menu_item_id,
      double? promotion_amount,
      String? promotion_type,
      String? calc_action,
      bool? is_show_promo,
      List? except_restaurants}) {
    return Coupon(
        id: this.id,
        is_valid: is_valid ?? this.is_valid,
        is_coupon_pass: is_coupon_pass ?? this.is_coupon_pass,
        messsage: messsage ?? this.messsage,
        restaurant_id: this.restaurant_id,
        title: title ?? this.title,
        code: this.code,
        start_date: this.start_date,
        end_date: this.end_date,
        start_time: this.start_time,
        end_time: this.end_time,
        valid_till: this.valid_till,
        coupon_type: this.coupon_type,
        offer_limit: this.offer_limit,
        order_count_limit_per_coupon: order_count_limit_per_coupon ?? this.order_count_limit_per_coupon,
        min_order_amount: min_order_amount ?? this.min_order_amount,
        max_order_amount: max_order_amount ?? this.max_order_amount,
        order_count_limit_per_user: order_count_limit_per_user ?? this.order_count_limit_per_user,
        used_order_count: used_order_count ?? this.used_order_count,
        discount_percent: discount_percent ?? this.discount_percent,
        discount_amount: discount_amount ?? this.discount_amount,
        used_count: this.used_count,
        short_description: this.short_description,
        long_description: this.long_description,
        image: this.image,
        status: this.status,
        menu_item_id: this.menu_item_id,
        promotion_amount: promotion_amount ?? this.promotion_amount,
        promotion_type: this.promotion_type,
        calc_action: this.calc_action,
        children: this.children,
        is_show_promo: is_show_promo ?? this.is_show_promo,
        except_restaurants: except_restaurants ?? this.except_restaurants);
  }

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        is_valid: true,
        is_coupon_pass: true,
        messsage: json["message"] ?? "",
        restaurant_id: json["restaurant_id"] ?? 0,
        title: json["title"] ?? "",
        code: json["code"] ?? "",
        start_time: json["start_time"],
        end_time: json["end_time"],
        start_date: json["start_date"],
        end_date: json["end_date"],
        valid_till: json["valid_till"],
        coupon_type: json["coupon_type"] ?? "",
        offer_limit: json["offer_limit"] ?? 0,
        used_count: json["used_count"] ?? 0,
        short_description: json["short_description"] ?? "",
        long_description: json["long_description"] ?? "",
        image: json["image"] ?? "",
        status: json["status"] ?? 0,
        menu_item_id: json["menu_item_id"] ?? 0,
        except_restaurants: json['except_restaurants'].cast<int>(),
        promotion_amount: json.containsKey('promotion_amount') ? json["promotion_amount"].toDouble() : 0.0,
        children: json["children"].map<CouponDetail>((child) {
          return CouponDetail(
            id: child['id'] ?? 0,
            promotion_id: child['promotion_id'],
            restaurant_id: child['restaurant_id'],
            menu_item_id: child['menu_item_id'],
            promo_code: child['promo_code'],
            discount_percent: child['discount_percent'],
            cost_sharing_percent: child['cost_sharing_percent'].toDouble(),
            discount_amount: child['discount_amount'].toDouble(),
            cost_sharing_amount: child['cost_sharing_amount'].toDouble(),
            min_order_amount: child['min_order_amount'].toDouble(),
            max_order_qty: child['max_order_qty'],
            fixed_delivery_fee: child['fixed_delivery_fee'].toDouble(),
            max_delivery_fee: child['max_delivery_fee'].toDouble(),
            created_at: child['created_at'],
            updated_at: child['updated_at'],
          );
        }).toList(),
        promotion_type: json["promotion_type"] ?? "",
        calc_action: json["calc_action"] ?? "",
        order_count_limit_per_coupon: json["order_count_limit_per_coupon"] ?? 0,
        min_order_amount: json["min_order_amount"].toDouble() ?? 0.0,
        max_order_amount: json["max_order_amount"].toDouble() ?? 0.0,
        order_count_limit_per_user: json["order_count_limit_per_user"] ?? 0,
        used_order_count: json["used_order_count"] ?? 0,
        discount_amount: json["discount_amount"].toDouble() ?? 0.0,
        discount_percent: json.containsKey('discount_percent') ? json["discount_percent"] : 0,
        is_show_promo: json['is_show_promo'] ?? true,
      );

/*

  final int order_count_limit_per_coupon;
  final double min_order_amount;
  final double max_order_amount;
  final int order_count_limit_per_user;
  final int used_order_count;
  final int discount_percent;
*/
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "code": code,
        "start_date": start_date,
        "end_date": end_date,
        "valid_till": valid_till,
        "coupon_type": coupon_type,
        "promotion_type": promotion_type,
        "calc_action": calc_action,
        "offer_limit": offer_limit,
        "used_count": used_count,
        "short_description": short_description,
        "long_description": long_description,
        "image": image,
        'children': childToJson(children!),
        "promotion_amount": promotion_amount,
        "order_count_limit_per_coupon": order_count_limit_per_coupon,
        "min_order_amount": min_order_amount,
        "max_order_amount": max_order_amount,
        "order_count_limit_per_user": order_count_limit_per_user,
        "used_order_count": used_order_count,
        "discount_percent": discount_percent,
        "discount_amount": discount_amount,
        "status": status,
        "is_show_promo": is_show_promo,
        "except_restaurants": except_restaurants,
      };

  List<Map<String, dynamic>>? childToJson(List<CouponDetail> children) {
    List<Map<String, dynamic>>? tempOptionGroups = children != null ? children.map((item) => item.toJson()).toList() : null;
    return tempOptionGroups;
  }
}

class CouponDetail {
  final int? id;
  final int? promotion_id;
  final int? restaurant_id;
  final int? menu_item_id;

  final String? promo_code;
  final int? discount_percent;
  final double? cost_sharing_percent;
  final double? discount_amount;
  final double? cost_sharing_amount;
  final double? min_order_amount;
  final int? max_order_qty;
  final double? fixed_delivery_fee;
  final double? max_delivery_fee;
  final String? created_at;
  final String? updated_at;

  CouponDetail(
      {this.id,
      this.promotion_id,
      this.restaurant_id,
      this.menu_item_id,
      this.promo_code,
      this.discount_percent,
      this.cost_sharing_percent,
      this.discount_amount,
      this.cost_sharing_amount,
      this.min_order_amount,
      this.max_order_qty,
      this.fixed_delivery_fee,
      this.max_delivery_fee,
      this.created_at,
      this.updated_at});

  CouponDetail copyWith({int? id, String? image, String? slug, String? title, String? description}) {
    return CouponDetail(
        id: id ?? this.id,
        promotion_id: promotion_id ?? this.promotion_id,
        restaurant_id: restaurant_id ?? this.restaurant_id,
        menu_item_id: menu_item_id ?? this.menu_item_id,
        promo_code: promo_code ?? this.promo_code,
        discount_percent: discount_percent ?? this.discount_percent,
        cost_sharing_percent: cost_sharing_percent ?? this.cost_sharing_percent,
        discount_amount: discount_amount ?? this.discount_amount,
        cost_sharing_amount: cost_sharing_amount ?? this.cost_sharing_amount,
        min_order_amount: min_order_amount ?? this.min_order_amount,
        max_order_qty: max_order_qty ?? this.max_order_qty,
        fixed_delivery_fee: fixed_delivery_fee ?? this.fixed_delivery_fee,
        max_delivery_fee: max_delivery_fee ?? this.max_delivery_fee,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "promotion_id": promotion_id,
        "restaurant_id": restaurant_id,
        "menu_item_id": menu_item_id,
        "promo_code": promo_code,
        "discount_percent": discount_percent,
        "cost_sharing_percent": cost_sharing_percent,
        "discount_amount": discount_amount,
        "cost_sharing_amount": cost_sharing_amount,
        "min_order_amount": min_order_amount,
        "max_order_qty": max_order_qty,
        "fixed_delivery_fee": fixed_delivery_fee,
        "max_delivery_fee": max_delivery_fee
      };
}
