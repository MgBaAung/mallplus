import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mall_plus_new_customer_app/models/order_history_model.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/widgets/network_image_widget.dart';

class CurrentOrderView extends StatelessWidget {
  final List<OrderHistoryModel> orderHistories;
  const CurrentOrderView({super.key, required this.orderHistories});

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
        int orderState = 0;
        if (order.cookingStatus == 1) {
          orderState = 1;
        } else if (order.deliveryStatus == 1) {
          orderState = 2;
        } else if (order.orderFinishStatus == 1) {
          orderState = 3;
        }
        return _orderItem(
            img: order.orderJson?.restaurant?.bannerImage ?? "",
            restaurantName: order.orderJson?.restaurant?.name ?? "",
            itemCount: (order.orderJson?.items?.length ?? 0).toString(),
            orderState: orderState,
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
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 22,
                      child: Text(
                        "Deliver your food",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                          color: AppColors.greenDark1,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.green,
                              shape: BoxShape.circle,
                            ),
                            child: SizedBox(
                              child: SvgPicture.asset(
                                "assets/Icons/Call.svg",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Delivery",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                  child: Text("Arrival between $deliveryTime to $endTime"),
                ),
                SizedBox(
                  height: 13,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              //color: AppColors.primary,
                              color: (orderState >= 1)
                                  ? AppColors.primary
                                  : Colors.grey.shade400,
                            ),
                            child: SvgPicture.asset(
                              "assets/Icons/cooking.svg",
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Container(
                        height: 3.5,
                        color: orderState >= 2
                            ? AppColors.primary
                            : Colors.grey.shade400,
                      )),
                      Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //color: AppColors.primary,
                          color: (orderState >= 2)
                              ? AppColors.primary
                              : Colors.grey.shade400,
                        ),
                        child: SvgPicture.asset(
                          "assets/Icons/delivering.svg",
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 3.5,
                        color: orderState >= 3
                            ? AppColors.primary
                            : Colors.grey.shade400,
                      )),
                      Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //color: AppColors.primary,
                          color: (orderState >= 3)
                              ? AppColors.primary
                              : Colors.grey.shade400,
                        ),
                        child: SvgPicture.asset(
                          "assets/Icons/complete.svg",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cooking"),
                    Text("Delivery"),
                    Text("Complete"),
                  ],
                ),
              ],
            ),
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
