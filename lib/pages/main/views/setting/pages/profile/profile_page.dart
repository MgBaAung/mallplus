import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/setting/pages/profile/controller/profile_controller.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/base_view_widget.dart';

import '../../../../../../utils/constants/app_colors.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

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
            "Profile",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        body: Obx(() => BaseViewWidget(
            onRefresh: controller.onRefresh,
            componentState: controller.componentState,
            content: _buildDataWidget())));
  }

  _buildDataWidget() {
    return Container(
      height: Get.height - 100,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue.shade100,
            child: SvgPicture.asset(
              "assets/Icons/user.svg",
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: 30,
              height: 30,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral9),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    "assets/Icons/user.svg",
                    colorFilter:
                        ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Name",
                  style: TextStyle(fontSize: 14),
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  child: SizedBox(
                    height: 20,
                    child: TextFormField(
                      // Initial value displayed

                      controller: controller.nameCtl,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        border:
                            InputBorder.none, // Hide input decoration border
                      ),
                      onChanged: (newValue) {
                        // Handle onChanged event if needed
                        // This callback will be triggered when the text changes
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral9),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    "assets/Icons/Call.svg",
                    colorFilter: ColorFilter.mode(
                        Colors.blue.withOpacity(0.10), BlendMode.srcIn),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Phone",
                  style: TextStyle(fontSize: 14),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  controller.phone,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          MaterialButton(
            onPressed: () {
              controller.updateProfile();
            },
            padding: EdgeInsets.all(15),
            minWidth: double.infinity,
            color: AppColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Update Profile",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
