import 'dart:convert';

import 'resturant_detail_model.dart';

class OrderHistoryModel {
  num? id;
  String? orderMessage;
  List<OrderStep>? orderStepMessage;
  CustomerVoucherSummary? customerVoucherSummary;
  num? commissionAmount;
  num? bikerPaidAmountToRestaurant;
  num? voucherId;
  num? totalTax;
  num? totalServiceCharges;
  num? totalGross;
  num? firstPaymentTotal;
  num? commissionPercentage;
  num? totalNet;
  num? voucherTotal;
  num? deliveryFee;
  String? requestTime;
  String? deliveryTime;
  String? deliveryTo;
  String? contactName;
  String? customerPhone;
  String? contactInfo;
  num? latitude;
  num? longitude;
  OrderJson? orderJson;
  num? restaurantStatus;
  num? cookingStatus;
  num? customerStatus;
  num? deliveryStatus;
  num? paymentStatus;
  num? orderFinishStatus;
  num? seenOrderStatus;
  num? bikerAcceptOrderStatus;
  num? arriveToRestaurantStatus;
  num? rejectStatus;
  String? createdAt;
  String? updatedAt;
  num? customerId;
  Customer? customer;
  dynamic deliveryUser;
  dynamic comments;
  dynamic release;
  dynamic promotionMessage;
  num? estimatedMin;
  num? orderType;
  num? step;
  num? onlinePaymentStatus;
  num? paymentProvider;
  num? kbzPrecreateStatus;
  dynamic kbzPrepayId;
  num? discount;
  num? promotionId;
  String? promotionTitle;
  num? promotionAmount;
  dynamic constantArriveOrderMinute;
  dynamic arriveOrderMinute;
  dynamic minArriveOrderMinute;
  num? orderStep;
  String? orderStepMessage2;
  String? orderStatusImage;
  Config? config;

  OrderHistoryModel({
    this.id,
    this.orderMessage,
    this.orderStepMessage,
    this.customerVoucherSummary,
    this.commissionAmount,
    this.bikerPaidAmountToRestaurant,
    this.voucherId,
    this.totalTax,
    this.totalServiceCharges,
    this.totalGross,
    this.firstPaymentTotal,
    this.commissionPercentage,
    this.totalNet,
    this.voucherTotal,
    this.deliveryFee,
    this.requestTime,
    this.deliveryTime,
    this.deliveryTo,
    this.contactName,
    this.customerPhone,
    this.contactInfo,
    this.latitude,
    this.longitude,
    this.orderJson,
    this.restaurantStatus,
    this.cookingStatus,
    this.customerStatus,
    this.deliveryStatus,
    this.paymentStatus,
    this.orderFinishStatus,
    this.seenOrderStatus,
    this.bikerAcceptOrderStatus,
    this.arriveToRestaurantStatus,
    this.rejectStatus,
    this.createdAt,
    this.updatedAt,
    this.customerId,
    this.customer,
    this.deliveryUser,
    this.comments,
    this.release,
    this.promotionMessage,
    this.estimatedMin,
    this.orderType,
    this.step,
    this.onlinePaymentStatus,
    this.paymentProvider,
    this.kbzPrecreateStatus,
    this.kbzPrepayId,
    this.discount,
    this.promotionId,
    this.promotionTitle,
    this.promotionAmount,
    this.constantArriveOrderMinute,
    this.arriveOrderMinute,
    this.minArriveOrderMinute,
    this.orderStep,
    this.orderStepMessage2,
    this.orderStatusImage,
    this.config,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> map) {
    return OrderHistoryModel(
      id: map['id'],
      orderMessage: map['order_message'],
      orderStepMessage: List<OrderStep>.from(
          (map['order_step_message'] ?? []).map((x) => OrderStep.fromJson(x))),
      customerVoucherSummary:
          CustomerVoucherSummary.fromJson(map['customer_voucher_summary']),
      commissionAmount: map['commission_amount'],
      bikerPaidAmountToRestaurant: map['biker_paid_amount_to_restaurant'],
      voucherId: map['voucher_id'],
      totalTax: map['total_tax'],
      totalServiceCharges: map['total_service_charges'],
      totalGross: map['total_gross'],
      firstPaymentTotal: map['first_payment_total'],
      commissionPercentage: map['commission_percentage'],
      totalNet: map['total_net'],
      voucherTotal: map['voucher_total'],
      deliveryFee: map['delivery_fee'],
      requestTime: map['request_time'],
      deliveryTime: map['delivery_time'],
      deliveryTo: map['delivery_to'],
      contactName: map['contact_name'],
      customerPhone: map['customer_phone'],
      contactInfo: map['contact_info'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      orderJson: OrderJson.fromJson(map['order_json']),
      restaurantStatus: map['restaurant_status'],
      cookingStatus: map['cooking_status'],
      customerStatus: map['customer_status'],
      deliveryStatus: map['delivery_status'],
      paymentStatus: map['payment_status'],
      orderFinishStatus: map['order_finish_status'],
      seenOrderStatus: map['seen_order_status'],
      bikerAcceptOrderStatus: map['biker_accept_order_status'],
      arriveToRestaurantStatus: map['arrive_to_restaurant_status'],
      rejectStatus: map['reject_status'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      customerId: map['customer_id'],
      customer: Customer.fromJson(map['customer']),
      deliveryUser: map['delivery_user'],
      comments: map['comments'],
      release: map['release'],
      promotionMessage: map['promotion_message'],
      estimatedMin: map['estimated_min'],
      orderType: map['order_type'],
      step: map['step'],
      onlinePaymentStatus: map['online_payment_status'],
      paymentProvider: map['payment_provider'],
      kbzPrecreateStatus: map['kbz_precreate_status'],
      kbzPrepayId: map['kbz_prepay_id'],
      discount: map['discount'],
      promotionId: map['promotion_id'],
      promotionTitle: map['promotion_title'],
      promotionAmount: map['promotion_amount'],
      constantArriveOrderMinute: map['constant_arrive_order_minute'],
      arriveOrderMinute: map['arrive_order_minute'],
      minArriveOrderMinute: map['min_arrive_order_minute'],
      orderStep: map['order_step'],
      orderStepMessage2: map['order_step_message2'],
      orderStatusImage: map['order_status_image'],
      config: Config.fromJson(map['config']),
    );
  }
}

class OrderStep {
  num? step;
  num? colorCode;
  String? title;
  List<StepChild>? children;

  OrderStep({
    this.step,
    this.colorCode,
    this.title,
    this.children,
  });

  factory OrderStep.fromJson(Map<String, dynamic> map) {
    return OrderStep(
      step: map['step'],
      colorCode: map['color_code'],
      title: map['title'],
      children: List<StepChild>.from(
          (map['children'] ?? []).map((x) => StepChild.fromJson(x))),
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'step': step,
      'color_code': colorCode,
      'title': title,
      'children': children?.map((x) => x.toMap()).toList(),
    };
  }
}

class StepChild {
  String? content;
  num? status;
  num? colorCode;

  StepChild({
    this.content,
    this.status,
    this.colorCode,
  });

  factory StepChild.fromJson(Map<String, dynamic> map) {
    return StepChild(
      content: map['content'],
      status: map['status'],
      colorCode: map['color_code'],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'status': status,
      'color_code': colorCode,
    };
  }
}

class CustomerVoucherSummary {
  String? orderCase;
  num? subTotal;
  num? tax;
  num? deliveryFee;
  num? voucherTotal;
  num? balancePay;
  num? onlinePay;
  num? cashOnDelivery;
  String? message;

  CustomerVoucherSummary({
    this.orderCase,
    this.subTotal,
    this.tax,
    this.deliveryFee,
    this.voucherTotal,
    this.balancePay,
    this.onlinePay,
    this.cashOnDelivery,
    this.message,
  });

  factory CustomerVoucherSummary.fromJson(Map<String, dynamic> map) {
    return CustomerVoucherSummary(
      orderCase: map['order_case'],
      subTotal: map['sub_total'],
      tax: map['tax'],
      deliveryFee: map['delivery_fee'],
      voucherTotal: map['voucher_total'],
      balancePay: map['balance_pay'],
      onlinePay: map['online_pay'],
      cashOnDelivery: map['cash_on_delivery'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'order_case': orderCase,
      'sub_total': subTotal,
      'tax': tax,
      'delivery_fee': deliveryFee,
      'voucher_total': voucherTotal,
      'balance_pay': balancePay,
      'online_pay': onlinePay,
      'cash_on_delivery': cashOnDelivery,
      'message': message,
    };
  }
}

class OrderJson {
  OrderJsonHeader? header;
  List<MenuItems>? items;
  Location? location;
  Restaurant? restaurant;

  OrderJson({
    this.header,
    this.items,
    this.location,
    this.restaurant,
  });

  factory OrderJson.fromJson(Map<String, dynamic> map) {
    return OrderJson(
      header: OrderJsonHeader.fromJson(map['header']),
      items: List<MenuItems>.from(
          (map['items'] ?? []).map((x) => MenuItems.fromJson(x))),
      location: Location.fromJson(map['location']),
      restaurant: Restaurant.fromJson(map['restaurant']),
    );
  }
}

class OrderJsonHeader {
  dynamic? comments;
  String? platform;
  dynamic? tableNo;
  num? takeAway;
  num? bikingMin;
  num? orderType;
  dynamic? cookingMin;
  String? contactName;
  String? requestTime;
  num? estimatedMin;
  num? restaurantId;
  String? townshipName;
  String? customerPhone;
  String? restaurantName;
  num? deliveryFee;
  num? bikerId;
  String? id;
  String? latitude;
  String? longitude;
  String? deliveryAddress;
  String? longitudeDel;
  String? latitudeDel;
  String? deliveryTo;

  OrderJsonHeader({
    this.comments,
    this.platform,
    this.tableNo,
    this.takeAway,
    this.bikingMin,
    this.orderType,
    this.cookingMin,
    this.contactName,
    this.requestTime,
    this.estimatedMin,
    this.restaurantId,
    this.townshipName,
    this.customerPhone,
    this.restaurantName,
    this.deliveryFee,
    this.bikerId,
    this.id,
    this.latitude,
    this.longitude,
    this.deliveryAddress,
    this.longitudeDel,
    this.latitudeDel,
    this.deliveryTo,
  });

  factory OrderJsonHeader.fromJson(Map<String, dynamic> map) {
    return OrderJsonHeader(
      comments: map['comments'],
      platform: map['platform'],
      tableNo: map['table_no'],
      takeAway: map['take_away'],
      bikingMin: map['biking_min'],
      orderType: map['order_type'],
      cookingMin: map['cooking_min'],
      contactName: map['contact_name'],
      requestTime: map['request_time'],
      estimatedMin: map['estimated_min'],
      restaurantId: map['restaurant_id'],
      townshipName: map['township_name'],
      customerPhone: map['customer_phone'],
      restaurantName: map['restaurant_name'],
      deliveryFee: map['delivery_fee'],
      bikerId: map['biker_id'],
      id: map['id'],
      latitude: map['latitude'].toString(),
      longitude: map['longitude'].toString(),
      deliveryAddress: map['delivery_address'],
      longitudeDel: map['longitude_del'],
      latitudeDel: map['latitude_del'],
      deliveryTo: map['delivery_to'],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'comments': comments,
      'platform': platform,
      'table_no': tableNo,
      'take_away': takeAway,
      'biking_min': bikingMin,
      'order_type': orderType,
      'cooking_min': cookingMin,
      'contact_name': contactName,
      'request_time': requestTime,
      'estimated_min': estimatedMin,
      'restaurant_id': restaurantId,
      'township_name': townshipName,
      'customer_phone': customerPhone,
      'restaurant_name': restaurantName,
      'delivery_fee': deliveryFee,
      'biker_id': bikerId,
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'delivery_address': deliveryAddress,
      'longitude_del': longitudeDel,
      'latitude_del': latitudeDel,
      'delivery_to': deliveryTo,
    };
  }
}

// class OrderItem {
//   num? quantity;
//   String? itemName;
//   List<Option>? options;
//   num? totalAmount;
//   num? restaurantItemId;

//   OrderItem({
//     this.quantity,
//     this.itemName,
//     this.options,
//     this.totalAmount,
//     this.restaurantItemId,
//   });

//   factory OrderItem.fromJson(Map<String, dynamic> map) {
//     return OrderItem(
//       quantity: map['quantity'],
//       itemName: map['item_name'],
//       options: List<Option>.from(
//           (map['options'] ?? []).map((x) => Option.fromJson(x))),
//       totalAmount: map['total_amount'],
//       restaurantItemId: map['restaurant_item_id'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   Map<String, dynamic> toMap() {
//     return {
//       'quantity': quantity,
//       'item_name': itemName,
//       'options': options?.map((x) => x.toMap()).toList(),
//       'total_amount': totalAmount,
//       'restaurant_item_id': restaurantItemId,
//     };
//   }
// }

class Option {
  String? optionName;
  List<OptionChild>? children;

  Option({
    this.optionName,
    this.children,
  });

  factory Option.fromJson(Map<String, dynamic> map) {
    return Option(
      optionName: map['option_name'],
      children: List<OptionChild>.from(
          (map['children'] ?? []).map((x) => OptionChild.fromJson(x))),
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'option_name': optionName,
      'children': children?.map((x) => x.toMap()).toList(),
    };
  }
}

class OptionChild {
  String? name;
  num? price;

  OptionChild({
    this.name,
    this.price,
  });

  factory OptionChild.fromJson(Map<String, dynamic> map) {
    return OptionChild(
      name: map['name'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }
}

class Location {
  num? id;
  String? name;
  String? address;

  Location({
    this.id,
    this.name,
    this.address,
  });

  factory Location.fromJson(Map<String, dynamic> map) {
    return Location(
      id: map['id'],
      name: map['name'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
    };
  }
}

class LocationMappings {
  List<Location>? locations;

  LocationMappings({
    this.locations,
  });

  factory LocationMappings.fromJson(Map<String, dynamic> map) {
    return LocationMappings(
      locations: List<Location>.from(
          (map['locations'] ?? []).map((x) => Location.fromJson(x))),
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'locations': locations?.map((x) => x.toMap()).toList(),
    };
  }
}

class RestaurantCategory {
  num? id;
  String? name;

  RestaurantCategory({
    this.id,
    this.name,
  });

  factory RestaurantCategory.fromJson(Map<String, dynamic> map) {
    return RestaurantCategory(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Customer {
  num? id;
  String? name;
  String? phone;

  Customer({
    this.id,
    this.name,
    this.phone,
  });

  factory Customer.fromJson(Map<String, dynamic> map) {
    return Customer(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }
}

class Config {
  String? androidVersion;
  String? iosVersion;
  String? merchantVersion;

  Config({
    this.androidVersion,
    this.iosVersion,
    this.merchantVersion,
  });

  factory Config.fromJson(Map<String, dynamic> map) {
    return Config(
      androidVersion: map['android_version'],
      iosVersion: map['ios_version'],
      merchantVersion: map['merchant_version'],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'android_version': androidVersion,
      'ios_version': iosVersion,
      'merchant_version': merchantVersion,
    };
  }
}
