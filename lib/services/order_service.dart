import 'package:mall_plus_new_customer_app/models/order_history_model.dart';
import 'package:mall_plus_new_customer_app/utils/constants/end_points.dart';

import '../models/http_ressponse_model.dart';

import 'api_service.dart';

abstract class OrderService {
  Future<HttpResponseModel> getOrderHistories();
}

class OrderServiceImpl implements OrderService {
  final _api = ApiService();

  @override
  Future<HttpResponseModel> getOrderHistories() async {
    HttpResponseModel response =
        await _api.getRequest(url: EndPoints.getOrderHistroy, body: {});
    if (response.isSuceess) {
      final List<OrderHistoryModel> data = List<OrderHistoryModel>.from(
        response.data["data"].map(
          (e) {
            return OrderHistoryModel.fromJson(e);
          },
        ),
      );
      response = response.copyWith(data: data);
    }
    return response;
  }
}
