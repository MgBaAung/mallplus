import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_env.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/network_image_widget.dart';

import '../constants/app_colors.dart';

class MenuItemWidget extends StatelessWidget {
  final String name;
  final String image;
  final double? width;
  final double? height;
  final String? price;
  final String? promotionText;
  final String rating;
  final String? storage_path;
  final String? deliveryMin;
  final VoidCallback? ontap;

  const MenuItemWidget({
    super.key,
    required this.name,
    required this.image,
    required this.promotionText,
    required this.rating,
    required this.deliveryMin,
    this.price,
    this.storage_path,
    this.width,
    this.height,
    this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap!=null?ontap:(){},
      child: Container(
        width: width??null,
        height: height??null,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(246, 41, 41, 0.10),
                blurRadius: 30,
                offset: Offset(0, 3),
              ),
            ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Stack(
                children: [
                  NetworkImageWidget(
                    //url: "https://mallplusmm.com/storage/menu_items/sm/$image",
                    url: "https://mallplusmm.com${storage_path??'/storage/restaurants/sm/'}$image",
                    sizeHeight: 161,
                    sizeWidth: double.infinity,
                  ),
                  Positioned(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            promotionText == null || promotionText == ""
                                ? const SizedBox()
                                : Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryDark1,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.all(5),
                              child: Text(
                                promotionText!,
                                style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 13,
                                    color: AppColors.secondary,
                                  ),
                                  Text(
                                    rating,
                                    style: TextStyle(
                                        fontSize: 11, fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(bottom: 0,child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                      child: Container(
                        width: 175,
                        height: 22,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white,width: 0.2)
                        ),
                        child: Text("Yangon Restaurant",style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w600,fontSize: 10
                        ),),
                      ),
                    ),
                  ),)
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Expanded(
                         flex: 5,
                         child: Text(
                                "${price!=null?price.toString():' '}Ks",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                    fontSize: 12, color: AppColors.primaryDark1),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                       ),
                        Expanded(
                          flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 14,
                                  height: 14,
                                  child: SvgPicture.asset(
                                    'assets/Icons/clock.svg',
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.green, BlendMode.srcIn),
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Expanded(
                                  child: Text(
                                    "$deliveryMin min",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 10, color: AppColors.green),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
