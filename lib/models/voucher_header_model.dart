class VoucherHeaderModel {
  String appVersion;
  dynamic id;
  num estimatedMin;
  num restaurantId;
  num customerAddressId;
  num userId;
  String restaurantName;
  String restaurantTownship;
  String customerTownship;
  num townshipId;
  String townshipName;
  num commissionPercentage;
  dynamic voucherHeaderModelOriginalDeliveryFee;
  dynamic voucherHeaderModelBeforeAdjDeliveryFee;
  double latitude;
  double longitude;
  String contactName;
  String customerPhone;
  dynamic cookingMin;
  num bikingMin;
  dynamic customerDeposit;
  num customerBalance;
  num voucherTotalBeforeReductBalance;
  num voucherTotal;
  num firstPaymentTotal;
  num netTotal;
  num total;
  dynamic serviceCharges;
  dynamic totalPackaging;
  num tax;
  num voucherHeaderModelTotalServiceCharges;
  num voucherHeaderModelSubTotal;
  num takeAway;
  dynamic orderStatusId;
  dynamic discount;
  dynamic tableNo;
  dynamic totalPeople;
  dynamic comments;
  num voucherHeaderModelDeliveryFee;
  dynamic voucherHeaderModelRoundAmount;
  dynamic currencyUnit;
  dynamic requestTime;
  dynamic contactInfo;
  String deliveryTo;
  dynamic deliveryTime;
  dynamic orderMessage;
  String address;
  num grossTotal;
  num totalRestaurantPrice;
  num subTotal;
  num beforeAdjDeliveryFee;
  num deliveryFee;
  num needOrderConfirm;
  num originalDeliveryFee;
  dynamic totalServiceCharges;
  dynamic roundAmount;
  num orderType;
  num addDay;
  dynamic preorderTime;
  num kbzPrecreateStatus;
  String kbzPrepayId;
  dynamic releaseMessage;
  dynamic voucherSummary;
  num promotionId;
  num promotionAmount;
  num isCouponPass;
  bool message;
  String promotionTitle;
  String platform;
  dynamic customer;
  dynamic config;

  VoucherHeaderModel({
    required this.appVersion,
    required this.id,
    required this.estimatedMin,
    required this.restaurantId,
    required this.customerAddressId,
    required this.userId,
    required this.restaurantName,
    required this.restaurantTownship,
    required this.customerTownship,
    required this.townshipId,
    required this.townshipName,
    required this.commissionPercentage,
    required this.voucherHeaderModelOriginalDeliveryFee,
    required this.voucherHeaderModelBeforeAdjDeliveryFee,
    required this.latitude,
    required this.longitude,
    required this.contactName,
    required this.customerPhone,
    required this.cookingMin,
    required this.bikingMin,
    required this.customerDeposit,
    required this.customerBalance,
    required this.voucherTotalBeforeReductBalance,
    required this.voucherTotal,
    required this.firstPaymentTotal,
    required this.netTotal,
    required this.total,
    required this.serviceCharges,
    required this.totalPackaging,
    required this.tax,
    required this.voucherHeaderModelTotalServiceCharges,
    required this.voucherHeaderModelSubTotal,
    required this.takeAway,
    required this.orderStatusId,
    required this.discount,
    required this.tableNo,
    required this.totalPeople,
    required this.comments,
    required this.voucherHeaderModelDeliveryFee,
    required this.voucherHeaderModelRoundAmount,
    required this.currencyUnit,
    required this.requestTime,
    required this.contactInfo,
    required this.deliveryTo,
    required this.deliveryTime,
    required this.orderMessage,
    required this.address,
    required this.grossTotal,
    required this.totalRestaurantPrice,
    required this.subTotal,
    required this.beforeAdjDeliveryFee,
    required this.deliveryFee,
    required this.needOrderConfirm,
    required this.originalDeliveryFee,
    required this.totalServiceCharges,
    required this.roundAmount,
    required this.orderType,
    required this.addDay,
    required this.preorderTime,
    required this.kbzPrecreateStatus,
    required this.kbzPrepayId,
    required this.releaseMessage,
    required this.voucherSummary,
    required this.promotionId,
    required this.promotionAmount,
    required this.isCouponPass,
    required this.message,
    required this.promotionTitle,
    required this.platform,
    required this.customer,
    required this.config,
  });

  Map<String, dynamic> toJson() {
    return {
      "app_version": appVersion,
      "id": id,
      "estimated_min": estimatedMin,
      "restaurant_id": restaurantId,
      "customer_address_id": customerAddressId,
      "user_id": userId,
      "restaurant_name": restaurantName,
      "restaurant_township": restaurantTownship,
      "customer_township": customerTownship,
      "township_id": townshipId,
      "township_name": townshipName,
      "commission_percentage": commissionPercentage,
      "original_delivery_fee": voucherHeaderModelOriginalDeliveryFee,
      "before_adj_delivery_fee": voucherHeaderModelBeforeAdjDeliveryFee,
      "latitude": latitude,
      "longitude": longitude,
      "contact_name": contactName,
      "customer_phone": customerPhone,
      "cooking_min": cookingMin,
      "biking_min": bikingMin,
      "customer_deposit": customerDeposit,
      "customer_balance": customerBalance,
      "voucher_total_before_reduct_balance": voucherTotalBeforeReductBalance,
      "voucher_total": voucherTotal,
      "first_payment_total": firstPaymentTotal,
      "net_total": netTotal,
      "total": total,
      "service_charges": serviceCharges,
      "total_packaging": totalPackaging,
      "tax": tax,
      "voucher_header_model_total_service_charges":
          voucherHeaderModelTotalServiceCharges,
      "voucher_header_model_sub_total": voucherHeaderModelSubTotal,
      "take_away": takeAway,
      "order_status_id": orderStatusId,
      "discount": discount,
      "table_no": tableNo,
      "total_people": totalPeople,
      "comments": comments,
      "delivery_fee": voucherHeaderModelDeliveryFee,
      "round_amount": voucherHeaderModelRoundAmount,
      "currency_unit": currencyUnit,
      "request_time": requestTime,
      "contact_info": contactInfo,
      "delivery_to": deliveryTo,
      "delivery_time": deliveryTime,
      "order_message": orderMessage,
      "address": address,
      "gross_total": grossTotal,
      "total_restaurant_price": totalRestaurantPrice,
      "sub_total": subTotal,
      "before_adj_delivery_fee": beforeAdjDeliveryFee,
      "delivery_fee": deliveryFee,
      "need_order_confirm": needOrderConfirm,
      "original_delivery_fee": originalDeliveryFee,
      "total_service_charges": totalServiceCharges,
      "round_amount": roundAmount,
      "order_type": orderType,
      "add_day": addDay,
      "preorder_time": preorderTime,
      "kbz_precreate_status": kbzPrecreateStatus,
      "kbz_prepay_id": kbzPrepayId,
      "release_message": releaseMessage,
      "voucher_summary": voucherSummary,
      "promotion_id": promotionId,
      "promotion_amount": promotionAmount,
      "is_coupon_pass": isCouponPass,
      "message": message,
      "promotion_title": promotionTitle,
      "platform": platform,
      "customer": customer,
      "config": config,
    };
  }
}
