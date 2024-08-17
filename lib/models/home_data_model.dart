import 'package:mall_plus_new_customer_app/models/category_model.dart';
import 'package:mall_plus_new_customer_app/models/menu_categories_model.dart';
import 'package:mall_plus_new_customer_app/models/restaurant_model.dart';
import 'package:mall_plus_new_customer_app/models/special_offer_model.dart';
import 'package:mall_plus_new_customer_app/models/user_model.dart';
import 'package:mall_plus_new_customer_app/models/user_address_model.dart';

class HomeData {
  bool? isAuth;
  UserInfo? userInfo;
  List<CategorySection>? categorySection;
  List<RestaurantModel>? restaurants;
  // List<NewRestaurants>? newRestaurants;
  List<SpecialOffers>? specialOffers;
  List<MenuCategories>? menuCategories;
  // Null? workingOrder;
  // Null? lastDeletedOrder;
  // double? lat;
  // double? long;
  // int? estimatedMin;
  // int? km;
  // int? promotionCount;
  // int? needRating;
  // Null? customerRating;
  // Null? rating;

  HomeData({
    this.isAuth,
    this.userInfo,
    this.categorySection,
    this.restaurants,
    // this.newRestaurants,
    this.specialOffers,
    this.menuCategories,
    // this.workingOrder,
    // this.lastDeletedOrder,
    // this.lat,
    // this.long,
    // this.estimatedMin,
    // this.km,
    // this.promotionCount,
    // this.needRating,
    // this.customerRating,
    // this.rating
  });

  HomeData.fromJson(Map<String, dynamic> json) {
    isAuth = json['is_auth'];
    userInfo = json['user_info'] != null ? new UserInfo.fromJson(json['user_info']) : null;
    if (json['category_section'] != null) {
      categorySection = <CategorySection>[];
      json['category_section'].forEach((v) {
        categorySection!.add(new CategorySection.fromJson(v));
      });
    }
    if (json['restaurants'] != null) {
      restaurants = <RestaurantModel>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(new RestaurantModel.fromJson(v));
      });
    }
    // if (json['new_restaurants'] != null) {
    //   newRestaurants = <NewRestaurants>[];
    //   json['new_restaurants'].forEach((v) {
    //     newRestaurants!.add(new NewRestaurants.fromJson(v));
    //   });
    // }
    if (json['special_offers'] != null) {
      specialOffers = <SpecialOffers>[];
      json['special_offers'].forEach((v) {
        specialOffers!.add(new SpecialOffers.fromJson(v));
      });
    }
    if (json['menu_categories'] != null) {
      menuCategories = <MenuCategories>[];
      json['menu_categories'].forEach((v) {
        menuCategories!.add(new MenuCategories.fromJson(v));
      });
    }
    // workingOrder = json['working_order'];
    // lastDeletedOrder = json['last_deleted_order'];
    // lat = json['lat'];
    // long = json['long'];
    // estimatedMin = json['estimated_min'];
    // km = json['km'];
    // promotionCount = json['promotion_count'];
    // needRating = json['need_rating'];
    // customerRating = json['customer_rating'];
    // rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_auth'] = this.isAuth;
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo!.toJson();
    }
    if (this.categorySection != null) {
      data['category_section'] =
          this.categorySection!.map((v) => v.toJson()).toList();
    }
    // if (this.restaurants != null) {
    //   data['restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
    // }
    // if (this.newRestaurants != null) {
    //   data['new_restaurants'] =
    //       this.newRestaurants!.map((v) => v.toJson()).toList();
    // }
    // if (this.specialOffers != null) {
    //   data['special_offers'] =
    //       this.specialOffers!.map((v) => v.toJson()).toList();
    // }
    if (this.menuCategories != null) {
      data['menu_categories'] = this.menuCategories!.map((v) => v.toJson()).toList();
    }
    // data['working_order'] = this.workingOrder;
    // data['last_deleted_order'] = this.lastDeletedOrder;
    // data['lat'] = this.lat;
    // data['long'] = this.long;
    // data['estimated_min'] = this.estimatedMin;
    // data['km'] = this.km;
    // data['promotion_count'] = this.promotionCount;
    // data['need_rating'] = this.needRating;
    // data['customer_rating'] = this.customerRating;
    // data['rating'] = this.rating;
    return data;
  }
}

class UserInfo {
  int? userId;
  double? latitude;
  double? longitude;
  User? user;
  List<UserAddress>? addresses;
  UserAddress? nearestAddress;

  UserInfo({this.userId, this.latitude, this.longitude, this.user, this.addresses, this.nearestAddress});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = int.parse(json['user_id']) as int;
    latitude = double.parse(json['latitude']);
    longitude = double.parse(json['longitude']);
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['addresses'] != null && json['addresses'].length > 1) {
      addresses = <UserAddress>[];
      json['addresses'].forEach((v) {
        addresses!.add(new UserAddress.fromJson(v));
      });
    } else {
      addresses = <UserAddress>[UserAddress.fromJson(json['addresses'][0])];
    }
    nearestAddress = json['nearest_address'] != null ? new UserAddress.fromJson(json['nearest_address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.addresses != null) {
      // data['addresses'] = this.addresses!.map((v) => v?.toJson()).toList();
    }
    if (this.nearestAddress != null) {
      data['nearest_address'] = this.nearestAddress!.toJson();
    }
    return data;
  }
}
