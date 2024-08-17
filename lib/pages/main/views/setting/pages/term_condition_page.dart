import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TermConditionPage extends StatelessWidget {
  const TermConditionPage({super.key});

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
          "Terms & Conditions",
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 24,
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Title",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListView.separated(
                    itemCount: 5,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\u2022',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.55,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ",
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
