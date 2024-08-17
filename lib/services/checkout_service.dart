import 'dart:convert';
import 'dart:io';

import 'package:mall_plus_new_customer_app/models/order_history_model.dart';
import 'package:mall_plus_new_customer_app/models/test_for_json.dart';
import 'package:mall_plus_new_customer_app/models/user_save_address_model.dart';
import 'package:mall_plus_new_customer_app/utils/constants/end_points.dart';

import '../models/cb_precreate.dart';
import '../models/http_ressponse_model.dart';
import '../models/resturant_detail_model.dart';
import '../models/user_model.dart';
import '../utils/constants/constants.dart';
import 'api_service.dart';
import 'local_storage_service.dart';

abstract class CheckoutService {
  Future<HttpResponseModel> calculateVoucher({required List<MenuItems> items});
  Future<HttpResponseModel> saveOrder(
      {required List<MenuItems> items,
      required Restaurant restaurant,
      required UserSaveAddressModel address,
      required DateTime orderTime});

  Future<HttpResponseModel> makePayment(
      {required int voucherId, required int paymentProvider});

  Future<HttpResponseModel> makeCBPay({
    required int voucherId,
  });

  Future<HttpResponseModel> getVoucher();
}

class CheckoutServiceImpl implements CheckoutService {
  final _api = ApiService();
  @override
  Future<HttpResponseModel> calculateVoucher(
      {required List<MenuItems> items}) async {
    final Map<String, dynamic> body = {
      "coupon": null,
      // // "restaurant": restaurant.toJson(),
      // // "header": header.toJson(),
      "items": List.from(items.map((e) => e.toJson())),
      // 'is_use_balance': false
    };

    HttpResponseModel response =
        await _api.postRequest(url: EndPoints.calculateVoucher, body: body);

    return response;
  }

  @override
  Future<HttpResponseModel> saveOrder(
      {required List<MenuItems> items,
      required Restaurant restaurant,
      required UserSaveAddressModel address,
      required DateTime orderTime}) async {
    final location = {
      "name": address.title,
      "address": address.addressDetail,
      "latitude": address.latitude,
      "longitude": address.longitude,
      "township_id": address.townshipId,
      "townshipId": address.townshipId,
      "township_name": address.townshipName,
      "townshipName": address.townshipName
    };
    final Map<String, dynamic> body = {
      "restaurant": restaurant.toJson(),
      "header": _getHeader(restaurant: restaurant, orderTime: orderTime),
      "items": List.from(items.map((e) => e.toJson())),
      "location": location
    };

    HttpResponseModel response =
        await _api.postRequest(url: EndPoints.saveOrder, body: body);

    return response;
  }

  Map<String, dynamic> _getHeader(
      {required Restaurant restaurant, required DateTime orderTime}) {
    var json = jsonDecode(LocalStorageServie.getData(USER));
    User user = User.fromJson(json);

    return {
      "estimated_min": restaurant.deliveryMin,
      "restaurant_id": restaurant.id,
      "restaurant_name": restaurant.name,
      "restaurant_township": restaurant.restaurantTownship,
      "township_name": "bahan",
      "contact_name": user.name,
      "customer_phone": user.phone,
      "cooking_min": null,
      "biking_min": 0,
      "take_away": 0,
      "table_no": null,
      "comments": null,
      "request_time": orderTime.toString(),
      "order_type": 0,
      "platform": Platform.isAndroid ? "android" : "ios",
      "delivery_time": orderTime.toString(),
    };
  }

  @override
  Future<HttpResponseModel> makePayment(
      {required int voucherId, required int paymentProvider}) async {
    HttpResponseModel response = await _api.getRequest(
        url: EndPoints.saveOnlinePayment,
        body: {},
        queryParam: {
          "id": voucherId,
          "payment_provider": paymentProvider,
          "status": 1
        });

    return response;
  }

  @override
  Future<HttpResponseModel> getVoucher() async {
    HttpResponseModel response =
        await _api.getRequest(url: EndPoints.getVoucher, body: {}, queryParam: {
      // "min": min,
      // "order_type": orderType,
    });
    if (response.isSuceess) {
      final OrderHistoryModel data =
          OrderHistoryModel.fromJson(response.data["data"]["last_order"]);
      response = response.copyWith(data: data);
    }

    return response;
  }

  @override
  Future<HttpResponseModel> makeCBPay({required int voucherId}) async {
    HttpResponseModel response =
        await _api.postRequest(url: EndPoints.preCreateCbPayment, body: {
      "id": voucherId.toString()
    }, queryParam: {
      // "min": min,
      // "order_type": orderType,
    });
    if (response.isSuceess) {
      final cbResponse = response.data['cb_response'];

      final data = CbPrecreateModel(
          result: "",
          generateRefOrder: cbResponse["generateRefOrder"],
          code: cbResponse["code"],
          msg: cbResponse["msg"],
          paymentProvider: 0);
      response = response.copyWith(data: data);
    } else {
      //response = response.copyWith(message: cbResponse["msg"]);
    }

    return response;
  }
}
