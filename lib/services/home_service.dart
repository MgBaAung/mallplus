import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:mall_plus_new_customer_app/models/home_data_model.dart';

import '../models/current_locattion_model.dart';
import '../models/http_ressponse_model.dart';
import '../models/menu_categories_model.dart';
import '../models/user_model.dart';
import '../utils/constants/constants.dart';
import '../utils/constants/end_points.dart';
import 'api_service.dart';
import 'local_storage_service.dart';

abstract class HomeService{
  Future<HttpResponseModel> getHomeData();
}

class HomeServiceImpl implements HomeService{
  final _api = ApiService();
  @override
  Future<HttpResponseModel> getHomeData() async {
    if(await LocalStorageServie.iskeyexists(USER)){
    var json = jsonDecode(LocalStorageServie.getData(USER));
    User user = User.fromJson(json);
    print(user.id);

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
        url: EndPoints.requestRestaurants + USELATLNGINQP, body: {}, queryParam: queryparam);

    if (response.isSuceess) {
      final HomeData data = HomeData.fromJson(response.data);
      // final List<MenuCategories> data = List<MenuCategories>.from(
      //   response.data["menu_categories"].map(
      //         (e) =>
      //           MenuCategories.fromJson(e),
      //   ),
      // );
      response = response.copyWith(data: data);
    }


    print(response);

    return response;
    }else{
      return HttpResponseModel(isSuceess: false, statusCode: "401", data: [], message: "Please Login first");
    }
  }

}