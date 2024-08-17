import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_route.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: GestureDetector(
        onTap: (){AppRoutes.back();},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/Icons/back-icon.svg',width: 24,height: 24),
            Text("Back",style: TextStyle(color: AppColors.blue,fontSize: 10,fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}
