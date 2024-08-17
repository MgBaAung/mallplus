import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/auth/common/widgets/CustomButton.dart';
import 'package:mall_plus_new_customer_app/services/local_storage_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';
import 'package:mall_plus_new_customer_app/utils/constants/constants.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageMenus = [
      {
        "icon": "assets/Icons/location-03.svg",
        "label": "Address",
        "route": AppRoutes.deliveryAddressPage,
      },
      {
        "icon": "assets/Icons/about.svg",
        "label": "About",
        "route": AppRoutes.about,
      },
      {
        "icon": "assets/Icons/term.svg",
        "label": "Term&Condition",
        "route": AppRoutes.termCondition,
      },
      {
        "icon": "assets/Icons/customer_support.svg",
        "label": "Customer support",
        "route": AppRoutes.customerSupport
      }
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _myProfileWidget(),
          const SizedBox(
            height: 18,
          ),
          const SizedBox(
            height: 22,
            child: Text(
              "General",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pageMenus.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) {
                final pageMenu = pageMenus[index];
                return InkWell(
                  onTap: () {
                    Get.toNamed(pageMenu["route"].toString());
                  },
                  child: Container(
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
                            pageMenu["icon"].toString(),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          pageMenu["label"].toString(),
                          style: TextStyle(fontSize: 14),
                        ),
                        const Expanded(child: SizedBox()),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(
                            'assets/Icons/arrow.svg',
                            colorFilter:
                                ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Flexible(child: SizedBox()),
          CustomButton("Logout", () {
            LocalStorageServie.deleteData(TOKEN);
            LocalStorageServie.deleteData(USER);
            AppRoutes.offalllogin();
          })
        ],
      ),
    );
  }

  _myProfileWidget() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.profilePage);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade400,
              child: SvgPicture.asset(
                "assets/Icons/user.svg",
                color: Colors.white,
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "My Profile",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  "assets/Icons/arrow.svg",
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
