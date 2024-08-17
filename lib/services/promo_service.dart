import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:mall_plus_new_customer_app/models/coupon_list_model.dart';
import 'package:mall_plus_new_customer_app/models/restaurant_model.dart';

import '../models/http_ressponse_model.dart';
import '../models/user_model.dart';
import '../utils/constants/constants.dart';
import '../utils/constants/end_points.dart';
import 'api_service.dart';
import 'local_storage_service.dart';

abstract class PromoService{
  Future<HttpResponseModel> getPromoRestaurants({required int id});
}

class PromoServiceImpl implements PromoService{
  final _api = ApiService();

  @override
  Future<HttpResponseModel> getPromoRestaurants({required int id}) async {
    var json = jsonDecode(LocalStorageServie.getData(USER));
    User user = User.fromJson(json);

    print(user.id);
    // Map<String, dynamic> queryparam = {
    //   'lat': geoPosition.latitude,
    //   'long': geoPosition.longitude,
    // };

    HttpResponseModel response = await _api.getRequest(
        url: EndPoints.requestPromotionRestaurants+"${id}"+USELATLNGINQP,
        // url: EndPoints.requestPromotionRestaurants+"${id}?lat=${geoPosition.latitude}&long=${geoPosition.longitude}",
        body: {},
        queryParam: {});

    if (response.isSuceess) {
      print(response.data);
      final List<RestaurantModel> data = List<RestaurantModel>.from(
        response.data["restaurants"].map(
              (e) =>
              RestaurantModel.fromJson(e),
        ),
      );
      print(data.length);
      response = response.copyWith(data: data);
    }
    print(response);
    return response;
  }
}