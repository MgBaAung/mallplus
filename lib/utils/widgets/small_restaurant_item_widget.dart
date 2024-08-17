import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';

import 'network_image_widget.dart';

class SmallRestaurantItemWidget extends StatelessWidget {
  final String image;
  final String restaurantName;
  final String foodName;
  final num discount;
  final num price;
  const SmallRestaurantItemWidget({
    super.key,
    required this.restaurantName,
    required this.foodName,
    required this.discount,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          Stack(
            children: [
              NetworkImageWidget(
                // url:
                //     "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/800px-Good_Food_Display_-_NCI_Visuals_Online.jpg",
                url: image,
                sizeWidth: 175,
                sizeHeight: 130,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 20,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    child: Container(
                      height: 30,
                      alignment: Alignment.center,
                      color: Colors.white.withOpacity(0.01),
                      child: Text(
                        restaurantName,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 192 - 130,
            width: 175,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 22,
                    child: Text(
                      foodName,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    )),
                SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      if (discount != 0)
                        Row(
                          children: [
                            Text(
                              (price - discount).toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.neutral7,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      Text(
                        //"${item.price} Ks",
                        "$price Ks",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
