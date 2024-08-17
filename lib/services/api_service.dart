import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mall_plus_new_customer_app/models/auth_result_model.dart';
import 'package:mall_plus_new_customer_app/models/user_address_model.dart';
import 'package:mall_plus_new_customer_app/models/user_model.dart';
import 'package:mall_plus_new_customer_app/services/local_storage_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';
import 'package:mall_plus_new_customer_app/utils/constants/end_points.dart';
import '../models/http_ressponse_model.dart';
import '../utils/constants/app_env.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  late String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImU3ZDZmYTMzYzJkN2E2YjFjMWQwMmE1ZThmY2IzYzMyNGI2ZGQ4ZmRjZWVlZTNlYjY4NjliN2I4OTE5NDBlODQ1OGZmMzY4ZDY4ODQ4NDI5In0.eyJhdWQiOiIzMCIsImp0aSI6ImU3ZDZmYTMzYzJkN2E2YjFjMWQwMmE1ZThmY2IzYzMyNGI2ZGQ4ZmRjZWVlZTNlYjY4NjliN2I4OTE5NDBlODQ1OGZmMzY4ZDY4ODQ4NDI5IiwiaWF0IjoxNzEyNDc1MTA3LCJuYmYiOjE3MTI0NzUxMDcsImV4cCI6MTc0NDAxMTEwNywic3ViIjoiMTA4OTM1Iiwic2NvcGVzIjpbXX0.QzYnhJMwOirM6ywMyWLJhJhtX5gDbezYEGtF5ad4ARmWemstCxhufBtKk0lXiZe04_pNyuO2ve-yQCrjY4-oL6hxDarMrK0Z6NuVTt1xcRyfqZB0l8SHo_AXaHF6Vt128PfqXVRoSq3jRm4m3h2-NCD0wkXg7XPnsrIpwzlO8YswgSDlQWhapf06X55cvfv9PVzbtt3u3BEzIeyQJM9AFvXeTgt4-cDtbZPkj3oDV5r4fDQmgX-wtwuoTYEqk_2TeKI2ndRt-9L6qWgurMygBupzGQrQw5e6-2mjnsXF1oDhj5G_n9VSf9VvUg6DBh_nTT9JBpupKp8e2EN4LMt3r11o2AdxWojPZZyXFqxZ6QpYFhhO4u0ElaJ53Z5hzqo504-ar1aDmIfLjRDWymwam_SC8U6I5ITWAiuvWSdLMFovz9a7dIo2nZflfZqYiZYOwRYcyB5k-TPD1AJPRvlU6GB83H-tlR-hrCfzL_-oaoQYRi7d-OEtjU4GP1W0TiTwUba9c-alviZrEAq59ougIPP4rjxzfH5FITzfNTkwqdV5eZDft0IVAKghuurGp6A_rC_-fjJxdCjaVLoseVyBzx4HlheboY7y2rULz1e35e5piodbYhcXsbijGGc2jdRykXK7ZO8IGDhjzKzQME4YDW8N-DEMNvZl5vGSGuVBM1Y';
  // late UserAddress location = UserAddress();
  late String addressTitle = '';
  late double latitude = 16.827289584866897;
  late double longitude = 96.17375649511814;
  final Dio api = Dio(
    BaseOptions(
      baseUrl: AppEnv.server_url,
      contentType: "application/json",
    ),
  );
  ApiService() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      _getToken();
      if (!options.path.contains('http')) {
        options.path = AppEnv.server_url + options.path;
      }

      if (options.path.contains(USELATLNGINQP)) {
        print("with lat and lng");
        await _getLocation();
        print("latitude : ${latitude}");
        print("longitude : ${longitude}");
        options.path = options.path.replaceFirst(USELATLNGINQP, '');
        options.queryParameters['lat'] = latitude;
        options.queryParameters['long'] = longitude;
      }

      if (options.path.contains(USELATLNGINBD)) {
        print("with lat and lng in body");
        await _getLocation();
        options.path = options.path.replaceFirst(USELATLNGINBD, '');
        options.queryParameters['lat'] = latitude;
        options.queryParameters['long'] = longitude;
      }

      print(options.path);
      print(options.queryParameters);
      options.headers['Authorization'] = 'Bearer $token';

      print(options.headers['Authorization']);
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      if (error.response?.statusCode == 401) {
        //refresh token
        return handler.resolve(await _retry(error.requestOptions));
      }
    }));
  }

  Future<HttpResponseModel> postRequest(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParam}) async {
    final result = await api.post(url, data: jsonEncode(body));
    print(result.data);
    return responseErrorHandling(response: result);
  }

  Future<HttpResponseModel> getRequest(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParam}) async {
    final result = await api.get(url, queryParameters: queryParam);
    return responseErrorHandling(response: result);
  }

  Future<HttpResponseModel> deleteRequest(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParam}) async {
    final result =
        await api.delete(url, data: body, queryParameters: queryParam);
    return responseErrorHandling(response: result);
  }

  Future<HttpResponseModel> responseErrorHandling({
    required Response response,
  }) async {
    try {
      final jsonData = response.data as Map<String, dynamic>;
      String message = jsonData.containsKey('message')
          ? jsonData['message']
          : response.statusMessage ?? '';
      if (response.statusCode == 200) {
        return HttpResponseModel(
          isSuceess: true,
          statusCode: response.statusCode.toString(),
          message: message,
          data: jsonData,
        );
      }

      return HttpResponseModel(
          isSuceess: false,
          statusCode: response.statusCode.toString(),
          message: jsonData["message"],
          data: {});
    } on DioError catch (e) {
      return HttpResponseModel(
          isSuceess: false,
          statusCode: response.statusCode.toString(),
          message: "$e",
          data: {});
    } on FormatException {
      return HttpResponseModel(
          isSuceess: false,
          statusCode: response.statusCode.toString(),
          message: "Invalid Format",
          data: {});
    } catch (e) {
      return HttpResponseModel(
          isSuceess: false,
          statusCode: response.statusCode.toString(),
          message: "Unknown Error $e",
          data: {});
    }
  }

  _getLocation() async {
    addressTitle = await LocalStorageServie.iskeyexists(ADDRESSTITLE)
        ? LocalStorageServie.getData(ADDRESSTITLE) ?? ''
        : '';
    print(addressTitle);
    if (addressTitle == "Current Location" || addressTitle == '') {
      print("current location");
      Position geoPosition = await Geolocator.getCurrentPosition();
      latitude = geoPosition.latitude;
      longitude = geoPosition.longitude;
    } else {
      print("selected location");
      latitude = await LocalStorageServie.iskeyexists(LATITUDE)
          ? double.parse(LocalStorageServie.getData(LATITUDE)) ??
              AppEnv.default_latitude
          : AppEnv.default_latitude;
      longitude = await LocalStorageServie.iskeyexists(LONGITUDE)
          ? double.parse(LocalStorageServie.getData(LONGITUDE)) ??
              AppEnv.default_longitude
          : AppEnv.default_longitude;
    }
    print("this is lat");
    print(latitude);
    print("this is long");
    print(longitude);
  }

  _getToken() async {
    //print(await LocalStorageServie.getData(USER));

    token = await LocalStorageServie.iskeyexists(TOKEN)
        ? LocalStorageServie.getData(TOKEN) ?? ''
        : '';

    print(token);
    // const localStorage = FlutterSecureStorage();
    // token = (await localStorage.read(key: 'loginToken')) ?? '';
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options =
        Options(method: requestOptions.method, headers: requestOptions.headers);
    return api.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
