import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mall_plus_new_customer_app/models/order_history_model.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/widgets/network_image_widget.dart';

class CancelOrderView extends StatelessWidget {
  final List<OrderHistoryModel> orderHistories;
  const CancelOrderView({super.key, required this.orderHistories});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orderHistories.length,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) {
        final order = orderHistories[index];
        return _orderItem(
            img: order.orderJson?.restaurant?.bannerImage ?? "",
            restaurantName: order.orderJson?.restaurant?.name ?? "",
            itemCount: (order.orderJson?.items?.length ?? 0).toString(),
            orderState: order.orderStep?.toInt() ?? 1,
            deliveryTime: order.deliveryTime ?? "",
            order: order);
      },
    );
  }

  Widget _orderItem(
      {required String img,
      required String restaurantName,
      required String itemCount,
      required int orderState,
      required String deliveryTime,
      required OrderHistoryModel order}) {
    final startTime = _parseTimeString(deliveryTime);
    DateTime newTime = startTime.add(const Duration(minutes: 30));
    final endTime =
        "${newTime.hour % 12}:${newTime.minute.toString().padLeft(2, '0')} ${newTime.hour >= 12 ? 'PM' : 'AM'}";
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(246, 41, 41, 0.10),
            blurRadius: 30,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              NetworkImageWidget(
                url: img,
                sizeWidth: 54,
                sizeHeight: 54,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurantName,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$itemCount Items",
                          style: TextStyle(
                              color: AppColors.neutral5, fontSize: 14),
                        ),
                        // Text("100ks"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.neutral9,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset(
                          "assets/Icons/clock.svg",
                          colorFilter: ColorFilter.mode(
                              AppColors.primary, BlendMode.srcIn),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Arrival Time",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "27/7/2024 5:30 Pm",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.neutral9,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset("assets/Icons/status.svg"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Status",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          MaterialButton(
            minWidth: double.infinity,
            onPressed: () {
              AppRoutes.toOrderHistoryDetailPage(order);
            },
            color: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "View order detail",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  DateTime _parseTimeString(String timeString) {
    List<String> parts = timeString.split(' ');
    String time = parts[0]; // Extract time part like "3:00"
    String period = parts[1]; // Extract period part like "pm"

    List<String> timeParts = time.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    if (period.toLowerCase() == 'pm' && hour < 12) {
      hour += 12; // Convert PM hour to 24-hour format
    }

    return DateTime(
        2024, 4, 7, hour, minute); // Use a specific date for parsing
  }
}
