import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mall_plus_new_customer_app/pages/restaurant_detail/controllers/restaurant_detail_controller.dart';

import '../../../utils/constants/app_colors.dart';

class PreOrderBottomSheetWidget extends StatefulWidget {
  const PreOrderBottomSheetWidget({super.key});

  @override
  State<PreOrderBottomSheetWidget> createState() =>
      _PreOrderBottomSheetWidgetState();
}

class _PreOrderBottomSheetWidgetState extends State<PreOrderBottomSheetWidget> {
  late List<DateTime> _todayOrderTimes;
  late List<DateTime> _tomorrowOrderTimes;

  @override
  void initState() {
    DateTime todayDateTime = DateTime.now();
    DateTime tomorrowDateTime = todayDateTime.add(Duration(days: 1));
    _todayOrderTimes = todayDateTime.hour > 8 && todayDateTime.hour < 18
        ? _generateOrderTime(todayDateTime.copyWith(second: 0, minute: 0),
            todayDateTime.copyWith(hour: 18))
        : [];
    _tomorrowOrderTimes = _generateOrderTime(
        tomorrowDateTime.copyWith(hour: 8, second: 0, minute: 0),
        tomorrowDateTime.copyWith(hour: 18));
    super.initState();
  }

  List<DateTime> _generateOrderTime(DateTime start, DateTime end) {
    List<DateTime> result = [];

    DateTime current = start;

    while (current.isBefore(end)) {
      result.add(current);

      current = current.add(Duration(hours: 1));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pre Order Date",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 40,
                child: TabBar(
                    dividerHeight: 0,
                    indicatorWeight: 0,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: EdgeInsets.symmetric(horizontal: 4),
                    labelColor: AppColors.primaryLight8,
                    indicator: BoxDecoration(
                      color: AppColors.primary,
                      //border: Border.all(color: AppColors.neutral9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    tabs: [
                      _buildTabWidget("Today"),
                      _buildTabWidget("Tommorrow"),
                    ]),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 24,
                child: Text(
                  "Pre Order Time",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                  child: TabBarView(children: [
                PreOrderTimeOptionWidget(orderTimes: _todayOrderTimes),
                PreOrderTimeOptionWidget(orderTimes: _tomorrowOrderTimes),
              ])),
            ],
          )),
    );
  }

  Widget _buildTabWidget(String label) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // color: Colors.red,
        border: Border.all(color: AppColors.neutral9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(child: Text(label)),
    );
  }
}

class PreOrderTimeOptionWidget extends GetView<RestaurantDetailController> {
  const PreOrderTimeOptionWidget({
    super.key,
    required List<DateTime> orderTimes,
  }) : _orderTimes = orderTimes;

  final List<DateTime> _orderTimes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _orderTimes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 3.5),
      itemBuilder: (context, index) {
        return Obx(() {
          final item = _orderTimes[index];
          final isSelected = controller.orderTime == item;
          return InkWell(
            onTap: () {
              controller.setPreOrderTime(item);
              Get.back();
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? AppColors.greenDark2 : AppColors.neutral9,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: Text(
                "${DateFormat("hh:mm a").format(item)} : ${DateFormat("hh:mm a").format(item.copyWith(minute: 30))}",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : null),
              ),
            ),
          );
        });
      },
    );
  }
}
