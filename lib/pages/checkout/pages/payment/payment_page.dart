import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/order_controlller.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/payment_controller.dart';

import '../../../../utils/constants/app_colors.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({super.key});

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
            "Payment",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset("assets/Images/payment.png"),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                      child: ListView.separated(
                    itemCount: controller.paymentList.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      final payment = controller.paymentList[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () => controller.setPaymentMethod(payment),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.neutral9,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                Image.asset(
                                  payment["image"],
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 40,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          payment["title"],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          payment["description"],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: AppColors.neutral5),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Radio(
                                    value: payment,
                                    groupValue:
                                        controller.selectedPayment.value,
                                    onChanged: (value) {},
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.neutral9, width: 0.5),
                  ),
                  child: SizedBox(
                    height: 22,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        GetBuilder<OrderController>(builder: (controller) {
                          return Text(
                            "${controller.total} Ks",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          );
                        })
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    controller.confirmPayment();
                  },
                  minWidth: double.infinity,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: AppColors.primary,
                  child: const Text(
                    "Confirm Payment",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
