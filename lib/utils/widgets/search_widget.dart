import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';

class SearchWidget extends StatelessWidget {
  String hinttext;
  String icon_path;
  final Function(String value) onChange;
  SearchWidget({super.key, required this.hinttext, required this.icon_path, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 358,
        height: 48,
        child: TextField(
          onChanged: onChange,
          decoration: InputDecoration(
              hintText: hinttext,
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
                onPressed: () {},
                icon: SvgPicture.asset(icon_path),
              )),
        ));
  }
}
