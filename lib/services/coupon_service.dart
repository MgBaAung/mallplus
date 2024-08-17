import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:mall_plus_new_customer_app/models/coupon_list_model.dart';
import 'package:mall_plus_new_customer_app/models/order_coupon_model.dart';

import '../models/http_ressponse_model.dart';
import '../models/user_model.dart';
import '../utils/constants/constants.dart';
import '../utils/constants/end_points.dart';
import 'api_service.dart';
import 'local_storage_service.dart';

abstract class CouponService {
  Future<HttpResponseModel> getCoupons();
  Future<HttpResponseModel> getOrderCoupons({required int id});
  Future<HttpResponseModel> searchOrderCoupons({required String code});
}

class CouponServiceImpl implements CouponService {
  final _api = ApiService();

  @override
  Future<HttpResponseModel> getCoupons() async {
    var json = jsonDecode(LocalStorageServie.getData(USER));
    User user = User.fromJson(json);
    print(user.id);
    Map<String, dynamic> queryparam = {
      'uid': user.id,
    };

    HttpResponseModel response = await _api.getRequest(
        url: EndPoints.requestcoupons + "?uid=${user.id}",
        body: {},
        queryParam: queryparam);

    if (response.isSuceess) {
      print(response.data);
      final List<Coupon> data = List<Coupon>.from(
        response.data["data"].map(
          (e) => Coupon.fromJson(e),
        ),
      );
      print(data.length);
      response = response.copyWith(data: data);
    }
    print(response);
    return response;
  }

  @override
  Future<HttpResponseModel> getOrderCoupons({required int id}) async {
    var json = jsonDecode(LocalStorageServie.getData(USER));
    User user = User.fromJson(json);
    Map<String, dynamic> queryparam = {
      'uid': user.id,
    };
    HttpResponseModel response = await _api.getRequest(
        url: EndPoints.requestRestaurants + "/$id/promotions",
        body: {},
        queryParam: queryparam);

    if (response.isSuceess) {
      final List<OrderCouponModel> data = List<OrderCouponModel>.from(
        response.data["data"].map(
          (e) => OrderCouponModel.fromJson(e),
        ),
      );

      response = response.copyWith(data: data);
    }

    return response;
  }

  @override
  Future<HttpResponseModel> searchOrderCoupons({required String code}) async {
    var json = jsonDecode(LocalStorageServie.getData(USER));
    User user = User.fromJson(json);
    Map<String, dynamic> queryparam = {
      "promo_code": code,
      'user_id': user.id,
    };
    HttpResponseModel response = await _api.postRequest(
        url: EndPoints.getHiddenCoupon, body: {}, queryParam: queryparam);

    if (response.isSuceess) {
      if (response.data["status"]) {
        final List<OrderCouponModel> data = List<OrderCouponModel>.from(
          response.data["data"].map(
            (e) => OrderCouponModel.fromJson(e),
          ),
        );
        response = response.copyWith(data: data);
      } else {
        response = response.copyWith(
            message: response.data["message"], isSucess: false);
      }
    }

    return response;
  }
}
