import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../utils/constants/app_colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
          "About",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 165,
            color: Colors.grey.shade400,
          ),
          const SizedBox(
            height: 33,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: TextStyle(fontSize: 14),
                  ),
                  Container(
                    height: 24,
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Follow Us",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      var nativeUrl = "fb://profile/";
                      var webUrl = "https://www.facebook.com/profile.php?id=";

                      try {
                        await launchUrlString(nativeUrl,
                            mode: LaunchMode.externalApplication);
                      } catch (e) {
                        await launchUrlString(webUrl,
                            mode: LaunchMode.platformDefault);
                      }
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
                              "assets/Icons/facebook.svg",
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Facebook",
                            style: TextStyle(fontSize: 14),
                          ),
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              'assets/Icons/arrow.svg',
                              colorFilter: ColorFilter.mode(
                                  Colors.blue, BlendMode.srcIn),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
