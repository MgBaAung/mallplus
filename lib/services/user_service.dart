import 'dart:convert';

import 'package:flutter_google_maps_webservices/places.dart';
import 'package:mall_plus_new_customer_app/models/http_ressponse_model.dart';
import 'package:mall_plus_new_customer_app/models/user_address_model.dart';
import 'package:mall_plus_new_customer_app/models/user_save_address_model.dart';
import 'package:mall_plus_new_customer_app/utils/constants/end_points.dart';

import '../models/user_model.dart';
import 'api_service.dart';

abstract class UserService {
  Future<HttpResponseModel> getUserAddresses();
  Future<HttpResponseModel> savenewUserAddresses(
      {required String action, required UserAddress address});
  Future<HttpResponseModel> getUserProfile();
  Future<HttpResponseModel> updateProfile(
      {required String id, required String name});
}

class UserServiceImpl extends UserService {
  final _api = ApiService();
  @override
  Future<HttpResponseModel> getUserAddresses() async {
    HttpResponseModel response = await _api
        .postRequest(url: EndPoints.userAddresses, body: {}, queryParam: {});

    if (response.isSuceess) {
      final Map<String, dynamic> jsonData = response.data;

      final List<UserSaveAddressModel> data = List<UserSaveAddressModel>.from(
        jsonData["addresses"].map(
          (e) => UserSaveAddressModel.fromJson(e),
        ),
      );
      response = response.copyWith(data: data);
    }

    return response;
  }

  @override
  Future<HttpResponseModel> savenewUserAddresses(
      {required String action, required UserAddress address}) async {
    String endpoint = "";
    switch (action) {
      case "EDIT" || "EDIT_POS":
        {
          endpoint = EndPoints.requestsaveaddresstype1;
        }
        break;
      case "SAVE_SUITABLE" || "SAVE_CURRENT_ADDR_AS_SUITABLE":
        {
          endpoint = EndPoints.requestsaveaddresstype4;
        }
        break;
      case "EDIT_ADDR":
        {
          endpoint = EndPoints.requestsaveaddresstype3;
        }
        break;
      case "SAVE_ADDR_WITH_TYPE":
        {
          endpoint = EndPoints.requestsaveaddresstype2;
        }
        break;
      default:
        {
          endpoint = EndPoints.requestsaveaddresstype4;
        }
        break;
    }

    var body = address.toJson();
    _api.getRequest(url: endpoint, body: body);
    HttpResponseModel response =
        await _api.postRequest(url: endpoint, body: body, queryParam: {});

    if (response.isSuceess) {
      final Map<String, dynamic> jsonData = response.data;
      final UserAddress data = UserAddress.fromJson(jsonData['data']);
      response = response.copyWith(data: data);
    }

    return response;
  }

  @override
  Future<HttpResponseModel> getUserProfile() async {
    HttpResponseModel response = await _api
        .postRequest(url: EndPoints.userProfile, body: {}, queryParam: {});

    if (response.isSuceess) {
      final Map<String, dynamic> jsonData = response.data;

      final User data = User.fromJson(jsonData["data"]);
      response = response.copyWith(data: data);
    }

    return response;
  }

  @override
  Future<HttpResponseModel> updateProfile(
      {required String id, required String name}) async {
    HttpResponseModel response =
        await _api.postRequest(url: EndPoints.updateUserInfo, body: {
      'id': id.toString(),
      'name': name.trim(),
    }, queryParam: {});

    if (response.isSuceess) {}

    return response;
  }
}
