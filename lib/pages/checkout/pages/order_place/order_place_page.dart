import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/order_controlller.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/pages/delivery_address/controllers/delivery_address_controller.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/network_image_widget.dart';

import '../../../../models/resturant_detail_model.dart';
import '../../../../utils/constants/app_colors.dart';

class OrderPlacePage extends GetView<OrderController> {
  const OrderPlacePage({super.key});

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
            "Order Confirm",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/Images/order_confirm.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  _deliveryField(),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.cartList.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) {
                          final item = controller.cartList[index];
                          return _cartItemWidget(item);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _couponSection(),
                      const SizedBox(
                        height: 16,
                      ),
                      _priceSummary(),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  )),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                controller.saveOrder();
              },
              minWidth: double.infinity,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: AppColors.primary,
              child: const Text(
                "Confirm",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _couponSection() {
    return InkWell(
      onTap: () {
        AppRoutes.toOrderCoupon();
      },
      child: Container(
        color: Colors.red,
        height: 80,
      ),
    );
  }

  Widget _priceSummary() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.neutral9, width: 0.5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: SizedBox(
                height: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Sub total",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "${controller.subTotal} Ks",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: AppColors.neutral9,
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: SizedBox(
                height: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Coupon",
                      style: TextStyle(fontSize: 12, color: AppColors.primary),
                    ),
                    Text(
                      "${controller.coupon} Ks",
                      style: TextStyle(fontSize: 12, color: AppColors.primary),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: AppColors.neutral9,
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: SizedBox(
                height: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "${controller.delivery} Ks",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 0.5,
              color: AppColors.neutral9,
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: SizedBox(
                height: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tax and Fees",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "${controller.tax} Ks",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 0.5,
              color: AppColors.neutral9,
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: SizedBox(
                height: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${controller.total} Ks",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell _deliveryField() {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        AppRoutes.toDeliveryAddressPage();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
            color: AppColors.primaryLight9,
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
                  GetBuilder<DeliveryAddressController>(
                      builder: (deliveryAddressController) {
                    return Obx(
                      () => Text(
                        deliveryAddressController.selectedUserAddress.id == -1
                            ? "Current Address"
                            : deliveryAddressController
                                .selectedUserAddress.addressDetail,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  })
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 21,
              height: 21,
              child: SvgPicture.asset(
                'assets/Icons/arrow.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartItemWidget(MenuItems item) {
    String name = item.name;
    final totalExtraAmt = item.extra.fold(
        0, (previousValue, element) => previousValue + element.price.toInt());
    String amount = (((item.price - item.discount) +
                item.packaging +
                totalExtraAmt +
                (item.requireExtra?.price ?? 0)) *
            item.qty)
        .toString();
    List<Extra> extra = [
      ...item.extra,
      if ((item.requireExtra?.price ?? 0) == 0 &&
          item.requireExtra!.name.isNotEmpty)
        item.requireExtra!
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          // BoxShadow(
          //   color: Color.fromRGBO(246, 41, 41, 0.10),
          //   blurRadius: 30,
          //   offset: Offset(0, 3),
          // ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              NetworkImageWidget(
                url: "",
                sizeHeight: 82,
                sizeWidth: 82,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: SizedBox(
                height: 82,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 24,
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 20,
                        child: Text(
                          "packing : + ${item.packaging} Ks",
                          style: const TextStyle(color: AppColors.neutral3),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 22,
                          child: Text(
                            "$amount Ks",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                          child: Text(
                            "QTY : ${item.qty}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade500),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          if (extra.isNotEmpty)
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade100, width: 1.5),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                itemCount: extra.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  final data = extra[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(data.name), Text("+ ${data.price}")],
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
