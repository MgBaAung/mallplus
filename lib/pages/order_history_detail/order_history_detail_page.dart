import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/order_history_model.dart';
import 'package:mall_plus_new_customer_app/models/resturant_detail_model.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/widgets/network_image_widget.dart';

class OrderHistoryDetailPage extends StatefulWidget {
  const OrderHistoryDetailPage({super.key});

  @override
  State<OrderHistoryDetailPage> createState() => _OrderHistoryDetailPageState();
}

class _OrderHistoryDetailPageState extends State<OrderHistoryDetailPage> {
  late OrderHistoryModel order;

  @override
  void initState() {
    order = Get.arguments["order"] as OrderHistoryModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int orderState = 0;
    if (order.cookingStatus == 1) {
      orderState = 1;
    } else if (order.deliveryStatus == 1) {
      orderState = 2;
    } else if (order.orderFinishStatus == 1) {
      orderState = 3;
    }
    final deliveryTime = order.deliveryTime;
    final startTime = _parseTimeString(order.deliveryTime ?? "00:00");
    DateTime newTime = startTime.add(const Duration(minutes: 30));
    final endTime =
        "${newTime.hour % 12}:${newTime.minute.toString().padLeft(2, '0')} ${newTime.hour >= 12 ? 'PM' : 'AM'}";

    final img = order.orderJson?.restaurant?.bannerImage ?? "";
    final restaurantName = order.orderJson?.restaurant?.name ?? "";
    // final items = [];
    // final
    final List<MenuItems> items = order.orderJson?.items ?? [];
    final total = _getTotal();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: MaterialButton(
          onPressed: () {
            Get.back();
          },
          child: Row(
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  'assets/Icons/back.svg',
                  // colorFilter:
                  //     const ColorFilter.mode(AppColors.green, BlendMode.srcIn),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text("Back")
            ],
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Order Detail",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
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
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${items.length} Items",
                                      style: TextStyle(
                                          color: AppColors.neutral5,
                                          fontSize: 14),
                                    ),
                                    Text("$total Ks"),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
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
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              child: Text(
                                  "Arrival between $deliveryTime to $endTime"),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                        height: 10,
                      ),
                      _deliveryField(),
                      const SizedBox(
                        height: 10,
                      ),
                      _orderDetail(),
                      const SizedBox(
                        height: 10,
                      ),
                      _paymentDetail(),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 20,
                          child: Center(
                            child: Text(
                              "Cancel Order",
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              //Get.offAllNamed(AppRoutes.mainPage);
              Get.offAndToNamed(AppRoutes.mainPage);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: SizedBox(
                height: 25,
                child: Center(
                  child: Text(
                    "Back to home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
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

  num _getTotal() {
    List<MenuItems> items = order.orderJson?.items ?? [];
    final total = items.fold(0, (previousValue, element) {
      return previousValue + _getItemTotal(element).toInt();
    });
    return total;
  }

  num _getItemTotal(MenuItems item) {
    final totalExtraAmt = item.extra.fold(
        0, (previousValue, element) => previousValue + element.price.toInt());

    final requireExtraCost = item.requireExtra?.price ?? 0;

    return (((item.price - item.discount) * item.qty) +
        totalExtraAmt +
        requireExtraCost);
  }

  Widget _deliveryField() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade100)),
      child: Row(
        children: [
          SizedBox(
            width: 21,
            height: 21,
            child: SvgPicture.asset(
              'assets/Icons/location-03.svg',
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Delivery Now",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Build 27,San Chaung street,Sanchaung",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderDetail() {
    final List<MenuItems> items = order.orderJson?.items ?? [];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade100)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
            child: Text(
              "Order Detail",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              final total = _getItemTotal(item);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 20, child: Text(item.name)),
                  SizedBox(height: 20, child: Text("+$total Ks"))
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget _paymentDetail() {
    final deliveryFee = order.orderJson?.restaurant?.deliveryFee ?? 0;
    final total = _getTotal();
    final subTotal = total + deliveryFee;
    final promotionAmount = order.promotionAmount ?? 0;
    final grandTotal = subTotal - promotionAmount;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade100)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
            child: Text(
              "Payment Detail",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20, child: Text("Total")),
              SizedBox(height: 20, child: Text("$total Ks"))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20, child: Text("Delivery Fee")),
              SizedBox(height: 20, child: Text("$deliveryFee Ks"))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20, child: Text("Sub Total")),
              SizedBox(height: 20, child: Text("$subTotal Ks"))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20, child: Text("Promo Code")),
              SizedBox(height: 20, child: Text("$promotionAmount Ks"))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 20,
                  child: Text(
                    "Total",
                    style: TextStyle(color: AppColors.primary),
                  )),
              SizedBox(height: 20, child: Text("$grandTotal Ks"))
            ],
          ),
        ],
      ),
    );
  }
}
