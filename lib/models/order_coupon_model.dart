class OrderCouponModel {
  int? id;
  int? restaurantId;
  String? title;
  String? code;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  Null? offerLimit;
  int? orderCountLimitPerCoupon;
  int? minOrderAmount;
  int? maxOrderAmount;
  int? orderCountLimitPerUser;
  int? usedOrderCount;
  int? discountPercent;
  int? discountAmount;
  int? menuItemId;
  int? promotionAmount;
  String? promotionType;
  bool? isShowPromo;
  String? calcAction;
  String? couponType;
  String? shortDescription;
  String? longDescription;

  String? createdAt;
  String? updatedAt;

  OrderCouponModel(
      {this.id,
      this.restaurantId,
      this.title,
      this.code,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.offerLimit,
      this.orderCountLimitPerCoupon,
      this.minOrderAmount,
      this.maxOrderAmount,
      this.orderCountLimitPerUser,
      this.usedOrderCount,
      this.discountPercent,
      this.discountAmount,
      this.menuItemId,
      this.promotionAmount,
      this.promotionType,
      this.isShowPromo,
      this.calcAction,
      this.couponType,
      this.shortDescription,
      this.longDescription,
      this.createdAt,
      this.updatedAt});

  OrderCouponModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    title = json['title'];
    code = json['code'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    offerLimit = json['offer_limit'];
    orderCountLimitPerCoupon = json['order_count_limit_per_coupon'];
    minOrderAmount = json['min_order_amount'];
    maxOrderAmount = json['max_order_amount'];
    orderCountLimitPerUser = json['order_count_limit_per_user'];
    usedOrderCount = json['used_order_count'];
    discountPercent = json['discount_percent'];
    discountAmount = json['discount_amount'];
    menuItemId = json['menu_item_id'];
    promotionAmount = json['promotion_amount'];
    promotionType = json['promotion_type'];
    isShowPromo = json['is_show_promo'];
    calcAction = json['calc_action'];
    couponType = json['coupon_type'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['title'] = this.title;
    data['code'] = this.code;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['offer_limit'] = this.offerLimit;
    data['order_count_limit_per_coupon'] = this.orderCountLimitPerCoupon;
    data['min_order_amount'] = this.minOrderAmount;
    data['max_order_amount'] = this.maxOrderAmount;
    data['order_count_limit_per_user'] = this.orderCountLimitPerUser;
    data['used_order_count'] = this.usedOrderCount;
    data['discount_percent'] = this.discountPercent;
    data['discount_amount'] = this.discountAmount;
    data['menu_item_id'] = this.menuItemId;
    data['promotion_amount'] = this.promotionAmount;
    data['promotion_type'] = this.promotionType;
    data['is_show_promo'] = this.isShowPromo;
    data['calc_action'] = this.calcAction;
    data['coupon_type'] = this.couponType;
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
