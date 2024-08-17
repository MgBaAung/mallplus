import 'dart:convert';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:mall_plus_new_customer_app/models/http_ressponse_model.dart';
import 'package:mall_plus_new_customer_app/models/restaurant_model.dart';

import 'package:mall_plus_new_customer_app/utils/constants/end_points.dart';

import '../models/resturant_detail_model.dart';
import '../models/user_model.dart';
import '../utils/constants/constants.dart';
import 'api_service.dart';
import 'local_storage_service.dart';

abstract class ResturantService {
  Future<HttpResponseModel> getResturants();
  Future<HttpResponseModel> getResturantsByMenuCategory(int menu_id);
  Future<HttpResponseModel> searchResturants({required String searchString});
  Future<HttpResponseModel> getResturantDetail({required int id});
}

class ResturantServiceImpl extends ResturantService {
  final _api = ApiService();
  
  @override
  Future<HttpResponseModel> getResturants() async {
    if(await LocalStorageServie.iskeyexists(USER)){
      var json = jsonDecode(LocalStorageServie.getData(USER));
      User user = User.fromJson(json);

      //fetch from realtime location
      //need to modify
      //to modify -> user's picked/selected location
      Position geoPosition = await Geolocator.getCurrentPosition();
      int? addressType = user.nearest_address?.address_type == null
          ? -1
          : user.nearest_address!.address_type;

      Map<String, dynamic> queryparam = {
        // 'lat': geoPosition.latitude,
        // 'long': geoPosition.longitude,
        'selected_address_type': addressType,
        'uid': user.id,
        'google_address': "",
        'address_type': "",
        'address_type_name': ""
      };

      HttpResponseModel response = await _api.getRequest(
          url: EndPoints.requestRestaurants + USELATLNGINQP,
          body: {},

          queryParam: queryparam);
                 log("data resstat : ${response.data}");

      if (response.isSuceess) {
        log("data resstat : ${response.data}");
        final List<RestaurantModel> data = List<RestaurantModel>.from(
          response.data["restaurants"].map(
            (e) => RestaurantModel.fromJson(e),
          ),
        );
        response = response.copyWith(data: data);
      }

      return response;
    }else{
    return HttpResponseModel(isSuceess: false, statusCode: "401", data: [], message: "Please Login first");
    }
  }

  @override
  Future<HttpResponseModel> searchResturants({required String searchString}) async {;

    Map<String, dynamic> queryparam = {
      // 'lat': geoPosition.latitude, 'long': geoPosition.longitude,
      'q': searchString.trim()};

    HttpResponseModel response = await _api.getRequest(url: EndPoints.requestSearchRestaurants+USELATLNGINQP, body: {}, queryParam: queryparam);

    if (response.isSuceess) {
      final List<RestaurantModel> data = List<RestaurantModel>.from(
        response.data["restaurants"].map(
          (e) => RestaurantModel.fromJson(e),
        ),
      );
      response = response.copyWith(data: data);
    }

    return response;
  }

  @override
  Future<HttpResponseModel> getResturantsByMenuCategory(int menu_id) async {
    if(await LocalStorageServie.iskeyexists(USER)){
      var json = jsonDecode(LocalStorageServie.getData(USER));
      User user = User.fromJson(json);

      // Position geoPosition = await Geolocator.getCurrentPosition();
      // int? addressType = user.nearest_address?.address_type == null ? -1 : user.nearest_address!.address_type;

      //fetch from realtime location
      //need to modify
      //to modify -> user's picked/selected location
      // Map<String,dynamic> queryparam = {
      //   'lat': geoPosition.latitude,
      //   'long': geoPosition.longitude,
      // };

      print(menu_id);
      HttpResponseModel response = await _api.getRequest(
          url:
              EndPoints.requestRestaurantsByMenu + menu_id.toString() + USELATLNGINQP,
          body: {},
          queryParam: {});

      if (response.isSuceess) {
        final List<RestaurantModel> data = List<RestaurantModel>.from(
          response.data["data"].map(
            (e) => RestaurantModel.fromJson(e),
          ),
        );
        response = response.copyWith(data: data);
      }

      return response;
    }else{
      return HttpResponseModel(isSuceess: false, statusCode: "401", data: [], message: "Please Login first");
    }
  }

  @override
  Future<HttpResponseModel> getResturantDetail({required int id}) async {
    Position geoPosition = await Geolocator.getCurrentPosition();

    // Map<String, dynamic> body = {
    //   'lat': geoPosition.latitude,
    //   'long': geoPosition.longitude,
    //   // "lat": "16.8434922",
    //   // "long": "96.1709184"
    // };

    HttpResponseModel response = await _api.getRequest(url: "${EndPoints.requestRestaurants}/$id" +USELATLNGINBD, body: {}, queryParam: {});
    // HttpResponseModel response = await _api.getRequest(
    //     url: "${EndPoints.requestRestaurants}/908", body: body, queryParam: {});

    if (response.isSuceess) {
      final Map<String, dynamic> json = response.data["data"];

      final RestaurantDetailModel data = RestaurantDetailModel.fromJson(json);
      response = response.copyWith(data: data);
    }

    return response;
  }
}
