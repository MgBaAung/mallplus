import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/order_controlller.dart';
import 'package:mall_plus_new_customer_app/pages/order_coupon/controller/order_coupon_controller.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/base_view_widget.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/search_widget.dart';

import '../../utils/constants/app_colors.dart';

class OrderCouponPage extends GetView<OrderCouponController> {
  const OrderCouponPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Coupon",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.grey,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Container(
                //   height: 40,
                //   color: Colors.grey,
                // ),
                // SearchWidget(
                //   hinttext: "Enter Promo Code Here",
                //   icon_path: "",
                //   onChange: (value) {
                //     controller.getHiddenCoupon(value);
                //   },
                // ),
                _searchBoxWidget(),
                Expanded(
                    child: Obx(
                  () => BaseViewWidget(
                    onRefresh: () => controller.onRefresh(),
                    componentState: controller.componentState,
                    errorWidget: Center(
                      child: Text("Not found promo code."),
                    ),
                    content: ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.coupons.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                      itemBuilder: (context, index) {
                        final data = controller.coupons[index];
                        return InkWell(
                          onTap: () {
                            controller.setCoupon(data);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.title ?? "",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data.shortDescription ?? "",
                                  //style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }

  _searchBoxWidget() {
    return TextField(
      onSubmitted: (value) {
        controller.getHiddenCoupon(value);
      },
      decoration: InputDecoration(
          hintText: "Enter Promo Code here",
          hintStyle: TextStyle(color: AppColors.neutral7),
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: AppColors.neutral9, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: AppColors.neutral9, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: AppColors.neutral9, width: 0.5),
          ),
          // focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide(
          //     color: AppColors.grey2,width: 0.5),
          // ),
          suffixIcon: IconButton(
            onPressed: () {
              controller.onRefresh();
            },
            icon: Icon(Icons.close),
          )),
    );
  }
}
