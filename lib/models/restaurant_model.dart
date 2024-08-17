class RestaurantModel {
  RestaurantModel({
    required this.id,
    required this.name,
    required this.image,
    required this.commissionPercentage,
    required this.foodType,
    required this.rating,
    required this.deliveryFree,
    required this.deliveryFixAmt,
    required this.increaseAmt,
    required this.decreaseAmt,
    required this.cookingTime,
    required this.amount,
    required this.latitude,
    required this.longitude,
    required this.openingTime,
    required this.closingTime,
    this.promotionText,
    required this.sorting,
    required this.cashDownStatus,
    required this.showPaymentOption,
    required this.distanceM,
    required this.distanceKm,
    required this.deliveryMin,
    required this.test,
    required this.deliveryFee,
    required this.minAmount,
    required this.imageSrc,
    required this.serviceStatus,
  });
  late final num id;
  late final String name;
  late final String image;
  late final num commissionPercentage;
  late final String foodType;
  late final String rating;
  late final num deliveryFree;
  late final num deliveryFixAmt;
  late final num increaseAmt;
  late final num decreaseAmt;
  late final String cookingTime;
  late final num amount;
  late final num latitude;
  late final num longitude;
  late final String openingTime;
  late final String closingTime;
  late final String? promotionText;
  late final num? sorting;
  late final num? cashDownStatus;
  late final num? showPaymentOption;
  late final num? distanceM;
  late final num? distanceKm;
  late final num? deliveryMin;
  late final String? test;
  late final num? deliveryFee;
  late final num? minAmount;
  late final String? imageSrc;
  late final num? serviceStatus;

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    image = json['image'] ?? "";
    commissionPercentage = json['commission_percentage'] ?? 0;
    foodType = json['food_type'];
    rating = json['rating'] ?? "0.0";
    deliveryFree = json['delivery_free'];
    deliveryFixAmt = json['delivery_fix_amt'];
    increaseAmt = json['increase_amt'] ?? 0;
    decreaseAmt = json['decrease_amt'] ?? 0;
    cookingTime = json['cooking_time'] ?? "";
    amount = json['amount'] ?? 0;
    latitude = json['latitude'] ?? 0;
    longitude = json['longitude'] ?? 0;
    openingTime = json['opening_time'] ?? "";
    closingTime = json['closing_time'] ?? "";
    promotionText = json["promotion_text"];
    sorting = json['sorting'] ?? 0;
    cashDownStatus = json['cash_down_status'] ?? 0;
    showPaymentOption = json['show_payment_option'] ?? 0;
    distanceM = json['distance_m'] ?? 0;
    distanceKm = json['distance_km'] ?? 0;
    deliveryMin = json['delivery_min'] ?? 0;
    test = json['test'] ?? "";
    deliveryFee = json['delivery_fee'] ?? 0;
    minAmount = json['min_amount'] ?? 0;
    imageSrc = json['image_src'] ?? "";
    serviceStatus = json['service_status'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['commission_percentage'] = commissionPercentage;
    _data['food_type'] = foodType;
    _data['rating'] = rating;
    _data['delivery_free'] = deliveryFree;
    _data['delivery_fix_amt'] = deliveryFixAmt;
    _data['increase_amt'] = increaseAmt;
    _data['decrease_amt'] = decreaseAmt;
    _data['cooking_time'] = cookingTime;
    _data['amount'] = amount;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['opening_time'] = openingTime;
    _data['closing_time'] = closingTime;
    _data['promotion_text'] = promotionText;
    _data['sorting'] = sorting;
    _data['cash_down_status'] = cashDownStatus;
    _data['show_payment_option'] = showPaymentOption;
    _data['distance_m'] = distanceM;
    _data['distance_km'] = distanceKm;
    _data['delivery_min'] = deliveryMin;
    _data['test'] = test;
    _data['delivery_fee'] = deliveryFee;
    _data['min_amount'] = minAmount;
    _data['image_src'] = imageSrc;
    _data['service_status'] = serviceStatus;
    return _data;
  }
}
