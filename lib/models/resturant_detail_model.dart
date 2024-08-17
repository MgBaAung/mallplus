class RestaurantDetailModel {
  RestaurantDetailModel({
    required this.restaurant,
    required this.menus,
  });
  late final Restaurant restaurant;
  late final List<Menus> menus;

  factory RestaurantDetailModel.emptyObj() {
    return RestaurantDetailModel(restaurant: Restaurant.emptyObj(), menus: []);
  }

  RestaurantDetailModel.fromJson(Map<String, dynamic> json) {
    print(json);
    restaurant = Restaurant.fromJson(json['restaurant']);
    menus = List.from(json['menus']).map((e) => Menus.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['restaurant'] = restaurant.toJson();
    _data['menus'] = menus.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.bannerImage,
    required this.tax,
    required this.slug,
    required this.email,
    required this.image,
    required this.phone,
    required this.amount,
    required this.rating,
    required this.address,
    required this.phone_2,
    required this.phone_3,
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.deletedAt,
    required this.updatedAt,
    required this.resPricing,
    required this.townshipId,
    required this.amountRange,
    required this.closingTime,
    required this.commingSoon,
    required this.contactName,
    required this.cookingTime,
    required this.decreaseAmt,
    required this.deliveryFree,
    required this.increaseAmt,
    required this.openingTime,
    required this.teleUserId,
    required this.branchStatus,
    required this.deliveryTime,
    required this.deliveryUnit,
    required this.ratingPerson,
    required this.deliveryAmount,
    required this.discountStatus,
    required this.cashDownStatus,
    required this.deliveryFixAmt,
    required this.commissionPercentage,
    required this.showPaymentOption,
    required this.distanceM,
    required this.distanceKm,
    required this.deliveryMin,
    required this.foodType,
    required this.deliveryFee,
    required this.minAmount,
    required this.imageSrc,
    required this.promotionText,
    required this.locationMappings,
    required this.restaurantTownship,
    required this.discount,
    required this.hasFreeDelivery,
    required this.restaurantCategories,
  });
  late final num id;
  late final String name;
  late final String description;
  late final String bannerImage;
  late final num tax;
  late final String slug;
  late final String email;
  late final String image;
  late final String phone;
  late final num amount;
  late final String rating;
  late final String address;
  late final String phone_2;
  late final String phone_3;
  late final num userId;
  late final num latitude;
  late final num longitude;
  late final String createdAt;
  late final String deletedAt;
  late final String updatedAt;
  late final num resPricing;
  late final num townshipId;
  late final String amountRange;
  late final String closingTime;
  late final num commingSoon;
  late final String contactName;
  late final String cookingTime;
  late final num decreaseAmt;
  late final num deliveryFree;
  late final num increaseAmt;
  late final String openingTime;
  late final num teleUserId;
  late final num branchStatus;
  late final String deliveryTime;
  late final String deliveryUnit;
  late final num ratingPerson;
  late final num deliveryAmount;
  late final num discountStatus;
  late final num cashDownStatus;
  late final num deliveryFixAmt;
  late final num commissionPercentage;
  late final num showPaymentOption;
  late final num distanceM;
  late final num distanceKm;
  late final num deliveryMin;
  late final String foodType;
  late final num deliveryFee;
  late final num minAmount;
  late final String imageSrc;
  late final String promotionText;
  late final LocationMappings? locationMappings;
  late final String restaurantTownship;
  late final num discount;
  late final bool hasFreeDelivery;
  late final List<RestaurantCategories> restaurantCategories;

  factory Restaurant.emptyObj() {
    return Restaurant(
      id: 0,
      name: "",
      description: "", // Provide default value for description
      bannerImage: "",
      tax: 0,
      slug: "",
      email: "",
      image: "", // Provide default value for image
      phone: "",
      amount: 0, // Provide default value for amount
      rating: "",
      address: "",
      phone_2: "", // Provide default value for phone_2
      phone_3: "", // Provide default value for phone_3
      userId: 0, // Provide default value for userId
      latitude: 0, // Provide default value for latitude
      longitude: 0, // Provide default value for longitude
      createdAt: "",
      deletedAt: "", // Provide default value for deletedAt
      updatedAt: "",
      resPricing: 0,
      townshipId: 0,
      amountRange: "", // Provide default value for amountRange
      closingTime: "",
      commingSoon: 0,
      contactName: "",
      cookingTime: "",
      decreaseAmt: 0,
      deliveryFree: 0,
      increaseAmt: 0,
      openingTime: "",
      teleUserId: 0,
      branchStatus: 0,
      deliveryTime: "", // Provide default value for deliveryTime
      deliveryUnit: "", // Provide default value for deliveryUnit
      ratingPerson: 0,
      deliveryAmount: 0,
      discountStatus: 0,
      cashDownStatus: 0,
      deliveryFixAmt: 0,
      commissionPercentage: 0,
      showPaymentOption: 0,
      distanceM: 0,
      distanceKm: 0,
      deliveryMin: 0,
      foodType: "", // Provide default value for foodType
      deliveryFee: 0,
      minAmount: 0,
      imageSrc: "",
      promotionText: "", // Provide default value for promotionText
      locationMappings: LocationMappings
          .emptyObj(), // Provide default value for locationMappings
      restaurantTownship: "",
      discount: 0,
      hasFreeDelivery: false, // Provide default value for hasFreeDelivery
      restaurantCategories: [], // Provide default value for restaurantCategories
    );
  }

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = "";
    bannerImage = json['banner_image'] ?? "";
    tax = json['tax'];
    slug = json['slug'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    amount = json['amount'];
    rating = json['rating'];
    address = json['address'];
    phone_2 = "";
    phone_3 = "";
    userId = json['user_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    deletedAt = "";
    updatedAt = json['updated_at'];
    resPricing = json['res_pricing'];
    townshipId = json['township_id'];
    amountRange = "";
    closingTime = json['closing_time'];
    commingSoon = json['comming_soon'];
    contactName = json['contact_name'];
    cookingTime = json['cooking_time'];
    decreaseAmt = json['decrease_amt'];
    deliveryFree = json['delivery_free'];
    increaseAmt = json['increase_amt'];
    openingTime = json['opening_time'];
    teleUserId = json['tele_user_id'];
    branchStatus = json['branch_status'];
    deliveryTime = "";
    deliveryUnit = "";
    ratingPerson = json['rating_person'];
    deliveryAmount = 0;
    discountStatus = json['discount_status'];
    cashDownStatus = json['cash_down_status'];
    deliveryFixAmt = json['delivery_fix_amt'];
    commissionPercentage = json['commission_percentage'];
    showPaymentOption = json['show_payment_option'];
    distanceM = json['distance_m'] ?? 0;
    distanceKm = json['distance_km'] ?? 0;
    deliveryMin = json['delivery_min'] ?? 0;
    foodType = "";
    deliveryFee = json['delivery_fee'];
    minAmount = json['min_amount'];
    imageSrc = json['image_src'];
    promotionText = "";
    locationMappings = json['location_mappings'] == null
        ? null
        : LocationMappings.fromJson(json['location_mappings']);
    restaurantTownship = json['restaurant_township'] ?? "";
    discount = json['discount'];
    hasFreeDelivery = json['has_free_delivery'];
    restaurantCategories = json['restaurant_categories'] == null
        ? []
        : List.from(json['restaurant_categories'])
            .map((e) => RestaurantCategories.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['banner_image'] = bannerImage;
    _data['tax'] = tax;
    _data['slug'] = slug;
    _data['email'] = email;
    _data['image'] = image;
    _data['phone'] = phone;
    _data['amount'] = amount;
    _data['rating'] = rating;
    _data['address'] = address;
    _data['phone_2'] = phone_2;
    _data['phone_3'] = phone_3;
    _data['user_id'] = userId;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['created_at'] = createdAt;
    _data['deleted_at'] = deletedAt;
    _data['updated_at'] = updatedAt;
    _data['res_pricing'] = resPricing;
    _data['township_id'] = townshipId;
    _data['amount_range'] = amountRange;
    _data['closing_time'] = closingTime;
    _data['comming_soon'] = commingSoon;
    _data['contact_name'] = contactName;
    _data['cooking_time'] = cookingTime;
    _data['decrease_amt'] = decreaseAmt;
    _data['delivery_free'] = deliveryFree;
    _data['increase_amt'] = increaseAmt;
    _data['opening_time'] = openingTime;
    _data['tele_user_id'] = teleUserId;
    _data['branch_status'] = branchStatus;
    _data['delivery_time'] = deliveryTime;
    _data['delivery_unit'] = deliveryUnit;
    _data['rating_person'] = ratingPerson;
    _data['delivery_amount'] = deliveryAmount;
    _data['discount_status'] = discountStatus;
    _data['cash_down_status'] = cashDownStatus;
    _data['delivery_fix_amt'] = deliveryFixAmt;
    _data['commission_percentage'] = commissionPercentage;
    _data['show_payment_option'] = showPaymentOption;
    _data['distance_m'] = distanceM;
    _data['distance_km'] = distanceKm;
    _data['delivery_min'] = deliveryMin;
    _data['food_type'] = foodType;
    _data['delivery_fee'] = deliveryFee;
    _data['min_amount'] = minAmount;
    _data['image_src'] = imageSrc;
    _data['promotion_text'] = promotionText;
    _data['location_mappings'] = locationMappings?.toJson() ?? {};
    _data['restaurant_township'] = restaurantTownship;
    _data['discount'] = discount;
    _data['has_free_delivery'] = hasFreeDelivery;
    _data['restaurant_categories'] =
        restaurantCategories.map((e) => e.toJson()).toList();
    return _data;
  }
}

class LocationMappings {
  LocationMappings({
    required this.id,
    required this.townshipFrom,
    required this.townshipTo,
    required this.deliveryTime,
    required this.maxDistance,
    required this.deliveryFees,
    required this.originalDeliveryFees,
    required this.agentFee,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
  late final num id;
  late final num townshipFrom;
  late final num townshipTo;
  late final num deliveryTime;
  late final num maxDistance;
  late final num deliveryFees;
  late final num originalDeliveryFees;
  late final num agentFee;
  late final num active;
  late final String createdAt;
  late final String updatedAt;
  late final String deletedAt;

  factory LocationMappings.emptyObj() {
    return LocationMappings(
      id: 0,
      townshipFrom: 0,
      townshipTo: 0,
      deliveryTime: 0,
      maxDistance: 0,
      deliveryFees: 0,
      originalDeliveryFees: 0,
      agentFee: 0,
      active: 0,
      createdAt: '',
      updatedAt: '',
      deletedAt: '',
    );
  }

  LocationMappings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    townshipFrom = json['township_from'];
    townshipTo = json['township_to'];
    deliveryTime = json['delivery_time'];
    maxDistance = json['max_distance'];
    deliveryFees = json['delivery_fees'];
    originalDeliveryFees = json['original_delivery_fees'];
    agentFee = json['agent_fee'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['township_from'] = townshipFrom;
    _data['township_to'] = townshipTo;
    _data['delivery_time'] = deliveryTime;
    _data['max_distance'] = maxDistance;
    _data['delivery_fees'] = deliveryFees;
    _data['original_delivery_fees'] = originalDeliveryFees;
    _data['agent_fee'] = agentFee;
    _data['active'] = active;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}

class RestaurantCategories {
  RestaurantCategories({
    required this.id,
    required this.name,
    required this.slug,
    required this.sorting,
    this.image,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.pivot,
  });
  late final num id;
  late final String name;
  late final String slug;
  late final num sorting;
  late final String? image;
  late final num active;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final Pivot pivot;

  RestaurantCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    sorting = json['sorting'];
    image = null;
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
    pivot = Pivot.fromJson(json['pivot']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['sorting'] = sorting;
    _data['image'] = image;
    _data['active'] = active;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['pivot'] = pivot.toJson();
    return _data;
  }
}

class Pivot {
  Pivot({
    required this.restaurantId,
    required this.restaurantCategoryId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final num restaurantId;
  late final num restaurantCategoryId;
  late final String createdAt;
  late final String updatedAt;

  Pivot.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    restaurantCategoryId = json['restaurant_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['restaurant_id'] = restaurantId;
    _data['restaurant_category_id'] = restaurantCategoryId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Menus {
  Menus({
    required this.id,
    required this.name,
    required this.slug,
    required this.sorting,
    required this.menuItems,
  });
  late final num id;
  late final String name;
  late final String slug;
  late final num sorting;
  late final List<MenuItems> menuItems;

  Menus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    sorting = json['sorting'];
    menuItems = List.from(json['menu_items'])
        .map((e) => MenuItems.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['sorting'] = sorting;
    _data['menu_items'] = menuItems.map((e) => e.toJson()).toList();
    return _data;
  }
}

class MenuItems {
  MenuItems(
      {required this.id,
      required this.restaurantId,
      required this.menuCategoryId,
      this.stockId,
      this.stockCode,
      required this.uuid,
      required this.name,
      required this.slug,
      this.description,
      required this.originalPrice,
      required this.price,
      required this.discount,
      required this.packaging,
      required this.qty,
      required this.amount,
      required this.total,
      this.imageSrc,
      required this.showImage,
      required this.type,
      required this.soldCount,
      required this.status,
      required this.isChanged,
      required this.imageCopied,
      required this.unavailableOption,
      required this.options,
      this.optionsBak,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      this.serviceOnAt,
      required this.deliveryDiscount,
      this.deliveryDiscountAmount,
      required this.commission,
      required this.restaurantPrice,
      this.extra = const [],
      this.requireExtra = null});
  late final num id;
  late final num restaurantId;
  late final num menuCategoryId;
  late final Null stockId;
  late final Null stockCode;
  late final num uuid;
  late final String name;
  late final String slug;
  late final String? description;
  late final num originalPrice;
  late final num price;
  late final num discount;
  late final num packaging;
  late final num qty;
  late final num amount;
  late final num total;
  late final String? imageSrc;
  late final num showImage;
  late final num type;
  late final num soldCount;
  late final num status;
  late final num isChanged;
  late final num imageCopied;
  late final num unavailableOption;
  late final List<Options> options;
  late final Null optionsBak;
  late final String createdAt;
  late final String updatedAt;
  late final String? deletedAt;
  late final String? serviceOnAt;
  late final num deliveryDiscount;
  late final Null deliveryDiscountAmount;
  late final num commission;
  late final num restaurantPrice;
  late final List<Extra> extra;
  late final Extra? requireExtra;

  MenuItems copyWith({
    num? id,
    num? restaurantId,
    num? menuCategoryId,
    num? uuid,
    String? name,
    String? slug,
    String? description,
    num? originalPrice,
    num? price,
    num? discount,
    num? packaging,
    num? qty,
    num? amount,
    num? total,
    String? imageSrc,
    num? showImage,
    num? type,
    num? soldCount,
    num? status,
    num? isChanged,
    num? imageCopied,
    num? unavailableOption,
    List<Options>? options,
    List<Extra>? optionalExtra,
    Extra? requireExtra,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? serviceOnAt,
    num? deliveryDiscount,
    num? deliveryDiscountAmount,
    num? commission,
    num? restaurantPrice,
  }) {
    return MenuItems(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      menuCategoryId: menuCategoryId ?? this.menuCategoryId,
      stockId: this.stockId,
      stockCode: this.stockCode,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      originalPrice: originalPrice ?? this.originalPrice,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      packaging: packaging ?? this.packaging,
      qty: qty ?? this.qty,
      amount: amount ?? this.amount,
      total: total ?? this.total,
      imageSrc: imageSrc ?? this.imageSrc,
      showImage: showImage ?? this.showImage,
      type: type ?? this.type,
      soldCount: soldCount ?? this.soldCount,
      status: status ?? this.status,
      isChanged: isChanged ?? this.isChanged,
      imageCopied: imageCopied ?? this.imageCopied,
      unavailableOption: unavailableOption ?? this.unavailableOption,
      options: options ?? this.options,
      extra: optionalExtra ?? extra,
      requireExtra: requireExtra ?? this.requireExtra,
      optionsBak: this.optionsBak,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serviceOnAt: serviceOnAt ?? this.serviceOnAt,
      deliveryDiscount: deliveryDiscount ?? this.deliveryDiscount,
      deliveryDiscountAmount: this.deliveryDiscountAmount,
      commission: commission ?? this.commission,
      restaurantPrice: restaurantPrice ?? this.restaurantPrice,
    );
  }

  MenuItems.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    restaurantId = json['restaurant_id'] ?? 0;
    menuCategoryId = json['menu_category_id'];
    stockId = null;
    stockCode = null;
    uuid = json['uuid'] ?? 0;
    name = json['name'] ?? "";
    slug = json['slug'] ?? "";
    originalPrice = json['original_price'] ?? 0;
    price = json['price'] ?? 0;
    discount = json['discount'] ?? 0;
    packaging = json['packaging'] ?? 0;
    qty = json['qty'] ?? 0;
    amount = json['amount'] ?? 0;
    total = json['total'] ?? 0;
    imageSrc = json["image_src"] ?? "";
    showImage = json['show_image'] ?? 0;
    type = json['type'] ?? 0;
    soldCount = json['sold_count'] ?? 0;
    status = json['status'] ?? 0;
    isChanged = json['is_changed'] ?? 0;
    imageCopied = json['image_copied'] ?? 0;
    unavailableOption = json['unavailable_option'] ?? 0;
    extra = [];
    //options = [];
    options = json['options'] == null
        ? []
        : List<Options>.from(json['options'].map((e) => Options.fromJson(e)));

    optionsBak = null;
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    deletedAt = null;
    serviceOnAt = null;
    deliveryDiscount = json['delivery_discount'] ?? 0;
    deliveryDiscountAmount = null;
    description = json["description"];
    commission = json['commission'] ?? 0;
    restaurantPrice = json['restaurant_price'];
    requireExtra = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['restaurant_id'] = restaurantId;
    _data['menu_category_id'] = menuCategoryId;
    _data['stock_id'] = stockId;
    _data['stock_code'] = stockCode;
    _data['uuid'] = uuid;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['description'] = description;
    _data['original_price'] = originalPrice;
    _data['price'] = price;
    _data['discount'] = discount;
    _data['packaging'] = packaging;
    _data['qty'] = qty;
    _data['amount'] = amount;
    _data['total'] = total;
    _data['image_src'] = imageSrc;
    _data['show_image'] = showImage;
    _data['type'] = type;
    _data['sold_count'] = soldCount;
    _data['status'] = status;
    _data['is_changed'] = isChanged;
    _data['image_copied'] = imageCopied;
    _data['unavailable_option'] = unavailableOption;
    _data['options'] = List.from(options.map((e) => e.toJson()));
    _data['options_bak'] = optionsBak;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['service_on_at'] = serviceOnAt;
    _data['delivery_discount'] = deliveryDiscount;
    _data['delivery_discount_amount'] = deliveryDiscountAmount;
    _data['commission'] = commission;
    _data['restaurant_price'] = restaurantPrice;
    return _data;
  }
}

class Options {
  Options({
    required this.id,
    required this.type,
    required this.title,
    required this.maxItem,
    required this.minItem,
    required this.sorting,
    required this.children,
    required this.selectedId,
  });
  late final num id;
  late final String? type;
  late final String? title;
  late final num? maxItem;
  late final num? minItem;
  late final num? sorting;
  late final List<Extra> children;
  late final num selectedId;

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    maxItem = json['maxItem'] is num
        ? json['maxItem']
        : num.parse(json['maxItem'] ?? "0");
    minItem = json['minItem'] is num
        ? json['minItem']
        : num.parse(json['minItem'] ?? "0");

    // minItem = json['minItem'];
    sorting = json['sorting'] is num
        ? json['sorting']
        : num.parse(json['sorting'] ?? "0");

    children = List.from(json["children"].map((e) => Extra.fromJson(e)));
    selectedId = json['selectedId'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['type'] = type;
    _data['title'] = title;
    _data['maxItem'] = maxItem;
    _data['minItem'] = minItem;
    _data['sorting'] = sorting;
    _data['children'] = children;
    _data['selectedId'] = selectedId;
    return _data;
  }
}

class Extra {
  Extra({
    required this.id,
    required this.qty,
    required this.tax,
    required this.name,
    required this.slug,
    required this.type,
    required this.uuid,
    required this.price,
    required this.total,
    required this.amount,
    required this.status,
    required this.discount,
    this.imageSrc,
    required this.createdAt,
    this.deletedAt,
    required this.updatedAt,
    this.description,
    required this.isSelected,
    required this.originalPrice,
    required this.stockCategoryId,
  });
  late final num id;
  late final num qty;
  late final num tax;
  late final String name;
  late final String slug;
  late final num type;
  late final num uuid;
  late final num price;
  late final num total;
  late final num amount;
  late final num status;
  late final num discount;
  late final Null imageSrc;
  late final String createdAt;
  late final Null deletedAt;
  late final String updatedAt;
  late final Null description;
  late final bool isSelected;
  late final num originalPrice;
  late final num stockCategoryId;

  factory Extra.emptyObj() {
    return Extra(
        id: -1,
        qty: 0,
        tax: 0,
        name: "",
        slug: "",
        type: 0,
        uuid: 0,
        price: 0,
        total: 0,
        amount: 0,
        status: 0,
        discount: 0,
        createdAt: "",
        updatedAt: "",
        isSelected: false,
        originalPrice: 0,
        stockCategoryId: 0);
  }

  Extra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qty = json['qty'];
    tax = json['tax'] ?? 0;
    name = json['name'] ?? "";
    slug = json['slug'];
    type = json['type'];
    uuid = json['uuid'] ?? 0;
    price = json['price'];
    total = json['total'];
    amount = json['amount'];
    status = json['status'];
    discount = json['discount'];
    imageSrc = null;
    createdAt = json['created_at'] ?? "";
    deletedAt = null;
    updatedAt = json['updated_at'] ?? "";
    description = null;
    isSelected = json['is_selected'];
    originalPrice = json['original_price'];
    stockCategoryId = json['stock_category_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['qty'] = qty;
    _data['tax'] = tax;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['type'] = type;
    _data['uuid'] = uuid;
    _data['price'] = price;
    _data['total'] = total;
    _data['amount'] = amount;
    _data['status'] = status;
    _data['discount'] = discount;
    _data['image_src'] = imageSrc;
    _data['created_at'] = createdAt;
    _data['deleted_at'] = deletedAt;
    _data['updated_at'] = updatedAt;
    _data['description'] = description;
    _data['is_selected'] = isSelected;
    _data['original_price'] = originalPrice;
    _data['stock_category_id'] = stockCategoryId;
    return _data;
  }
}

class SelectedId {
  SelectedId({
    required this.id,
    required this.qty,
    required this.tax,
    required this.name,
    required this.slug,
    required this.type,
    required this.uuid,
    required this.price,
    required this.total,
    required this.amount,
    required this.status,
    required this.discount,
    this.imageSrc,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
    this.description,
    this.isSelected,
    required this.originalPrice,
    required this.stockCategoryId,
  });
  late final num id;
  late final num qty;
  late final num tax;
  late final String name;
  late final String slug;
  late final num type;
  late final num uuid;
  late final num price;
  late final num total;
  late final num amount;
  late final num status;
  late final num discount;
  late final num? imageSrc;
  late final String? createdAt;
  late final String? deletedAt;
  late final String? updatedAt;
  late final String? description;
  late final bool? isSelected;
  late final num? originalPrice;
  late final num stockCategoryId;

  SelectedId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qty = json['qty'];
    tax = json['tax'];
    name = json['name'];
    slug = json['slug'];
    type = json['type'];
    uuid = json['uuid'];
    price = json['price'];
    total = json['total'];
    amount = json['amount'];
    status = json['status'];
    discount = json['discount'];
    imageSrc = null;
    createdAt = null;
    deletedAt = null;
    updatedAt = null;
    description = null;
    isSelected = null;
    originalPrice = json['original_price'];
    stockCategoryId = json['stock_category_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['qty'] = qty;
    _data['tax'] = tax;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['type'] = type;
    _data['uuid'] = uuid;
    _data['price'] = price;
    _data['total'] = total;
    _data['amount'] = amount;
    _data['status'] = status;
    _data['discount'] = discount;
    _data['image_src'] = imageSrc;
    _data['created_at'] = createdAt;
    _data['deleted_at'] = deletedAt;
    _data['updated_at'] = updatedAt;
    _data['description'] = description;
    _data['is_selected'] = isSelected;
    _data['original_price'] = originalPrice;
    _data['stock_category_id'] = stockCategoryId;
    return _data;
  }
}
