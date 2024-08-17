import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mall_plus_new_customer_app/models/menu_categories_model.dart';
import 'package:mall_plus_new_customer_app/models/user_address_model.dart';
import 'package:mall_plus_new_customer_app/services/local_storage_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';
import 'package:mall_plus_new_customer_app/utils/constants/end_points.dart';
import 'package:mall_plus_new_customer_app/models/home_data_model.dart';
import 'package:mall_plus_new_customer_app/models/current_locattion_model.dart';
import 'package:mall_plus_new_customer_app/services/api_service.dart';

import '../models/http_ressponse_model.dart';
import '../models/user_model.dart';
import '../utils/constants/app_env.dart';

abstract class MainService {
  Future<HomeData> gethomedata(CurrentLocation? location);
  Future<void> setLocation(UserAddress address);
}

class MainServiceImpl implements MainService {
  static final String _url = AppEnv.server_url;
  final _api = ApiService();

  @override
  Future<void> setLocation(UserAddress address)async {
    LocalStorageServie.setData(LATITUDE, address.latitude.toString());
    LocalStorageServie.setData(LONGITUDE, address.longitude.toString());
    LocalStorageServie.setData(ADDRESSTITLE, address.title!);
    
  }


  @override
  Future<HomeData> gethomedata(CurrentLocation? location) async {
    int? addressType = (location!.addressType == null) ? -1 : location.addressType;
    var user = jsonDecode(LocalStorageServie.getData(USER));
    Map<String, dynamic> queryparam = {
      // 'lat': location.latitude.toString(),
      // 'long': location.longitude.toString(),
      'selected_address_type': addressType,
      'uid': user['id'],
      'google_address': location.googleAddress,
      'address_type': location.addressType,
      'address_type_name': location.addressTypeName
    };
    HttpResponseModel response = await _api.getRequest(
        url: _url +
            EndPoints.requesthomedata + USELATLNGINQP,
            // '?lat=${location.latitude}&long=${location.longitude}&selected_address_type=$addressType&uid=${location.userId}&google_address=${location.googleAddress}&address_type=${location.addressType}&address_type_name=${location.addressTypeName}',
        body: {},
        queryParam: queryparam);
    if (response.isSuceess) {
      final result = HomeData.fromJson(response.data);
      return result;
    }
    return HomeData();
  }
}
