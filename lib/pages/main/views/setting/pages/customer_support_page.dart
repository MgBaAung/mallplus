import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../utils/constants/app_colors.dart';

class CustomerSupportPage extends StatelessWidget {
  const CustomerSupportPage({super.key});

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
          "Customer Support",
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
                  MaterialButton(
                    color: AppColors.greenDark3,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () async {
                      Uri url = Uri(scheme: 'tel', path: "09123123123");
                      if (await canLaunchUrl(url)) {
                        launchUrl(url);
                      }
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: SvgPicture.asset(
                            "assets/Icons/Call.svg",
                            colorFilter: ColorFilter.mode(
                                Colors.white.withOpacity(0.5), BlendMode.srcIn),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              "Customer Service",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.white70),
                            ),
                            Text(
                              "09 123 123 123",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.white70),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () async {
                      print("heyy");
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailUri = Uri(
                        scheme: 'mailto',
                        path: 'mallplus@gmail.com',
                        query: encodeQueryParameters(
                            <String, String>{'subject': '', 'body': ""}),
                      );

                      if (await canLaunchUrl(emailUri)) {
                        launchUrl(emailUri);
                      } else {
                        //failure
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
                              "assets/Icons/mail.svg",
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "mallplus@gmail.com",
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
                  SizedBox(
                    height: 10,
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
                            "MallPlus",
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
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      var nativeUrl = "viber://chat?number=09123123123";
                      var webUrl = "viber://chat?number=09123123122";

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
                              "assets/Icons/viber.svg",
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "09123123123",
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
