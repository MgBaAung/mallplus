import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/user_save_address_model.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/pages/delivery_address/controllers/delivery_address_controller.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/base_view_widget.dart';

import '../../../../utils/constants/app_colors.dart';

class DeliveryAddressPage extends GetView<DeliveryAddressController> {
  const DeliveryAddressPage({super.key});

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
          "Delivery Address",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => BaseViewWidget(
              onRefresh: controller.onRefresh,
              componentState: controller.componentState,
              content: _buildDataContent()),
        ),
      ),
    );
  }

  Widget _buildDataContent() {
    return SizedBox(
      height: Get.height,
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: controller.userAddresses.length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemBuilder: (context, index) {
                  final address = controller.userAddresses[index];
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade100)),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Obx(
                          () => Radio<UserSaveAddressModel>(
                            value: address,
                            groupValue: controller.selectedUserAddress,
                            onChanged: (value) {
                              controller.setUserAddress(value!);
                            },
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                address.title,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                address.addressDetail,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: AppColors.primary,
                            ))
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => AppRoutes.toMapPlacePicker(),
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight9,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Add New Address",
                      style: TextStyle(fontSize: 12, color: AppColors.primary),
                    )),
              )
            ],
          ))
        ],
      ),
    );
  }
}
