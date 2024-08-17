class SpecialOffers {
  int? id;
  String? name;
  String? image;
  int? commissionPercentage;
  String? foodType;
  String? rating;
  int? deliveryFree;
  int? increaseAmt;
  int? decreaseAmt;
  int? deliveryFixAmt;
  int? amount;
  String? cookingTime;
  double? latitude;
  double? longitude;
  String? openingTime;
  String? closingTime;
  String? promotionText;
  int? cashDownStatus;
  int? showPaymentOption;
  double? distanceM;
  double? distanceKm;
  int? deliveryMin;
  int? deliveryFee;
  int? minAmount;
  String? imageSrc;
  int? serviceStatus;

  SpecialOffers(
      {this.id,
        this.name,
        this.image,
        this.commissionPercentage,
        this.foodType,
        this.rating,
        this.deliveryFree,
        this.increaseAmt,
        this.decreaseAmt,
        this.deliveryFixAmt,
        this.amount,
        this.cookingTime,
        this.latitude,
        this.longitude,
        this.openingTime,
        this.closingTime,
        this.promotionText,
        this.cashDownStatus,
        this.showPaymentOption,
        this.distanceM,
        this.distanceKm,
        this.deliveryMin,
        this.deliveryFee,
        this.minAmount,
        this.imageSrc,
        this.serviceStatus});

  SpecialOffers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    commissionPercentage = json['commission_percentage'];
    foodType = json['food_type'];
    rating = json['rating'];
    deliveryFree = json['delivery_free'];
    increaseAmt = json['increase_amt'];
    decreaseAmt = json['decrease_amt'];
    deliveryFixAmt = json['delivery_fix_amt'];
    amount = json['amount'];
    cookingTime = json['cooking_time'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    promotionText = json['promotion_text'];
    cashDownStatus = json['cash_down_status'];
    showPaymentOption = json['show_payment_option'];
    distanceM = json['distance_m'];
    distanceKm = json['distance_km'];
    deliveryMin = json['delivery_min'];
    deliveryFee = json['delivery_fee'];
    minAmount = json['min_amount'];
    imageSrc = json['image_src'];
    serviceStatus = json['service_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['commission_percentage'] = this.commissionPercentage;
    data['food_type'] = this.foodType;
    data['rating'] = this.rating;
    data['delivery_free'] = this.deliveryFree;
    data['increase_amt'] = this.increaseAmt;
    data['decrease_amt'] = this.decreaseAmt;
    data['delivery_fix_amt'] = this.deliveryFixAmt;
    data['amount'] = this.amount;
    data['cooking_time'] = this.cookingTime;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['opening_time'] = this.openingTime;
    data['closing_time'] = this.closingTime;
    data['promotion_text'] = this.promotionText;
    data['cash_down_status'] = this.cashDownStatus;
    data['show_payment_option'] = this.showPaymentOption;
    data['distance_m'] = this.distanceM;
    data['distance_km'] = this.distanceKm;
    data['delivery_min'] = this.deliveryMin;
    data['delivery_fee'] = this.deliveryFee;
    data['min_amount'] = this.minAmount;
    data['image_src'] = this.imageSrc;
    data['service_status'] = this.serviceStatus;
    return data;
  }
}