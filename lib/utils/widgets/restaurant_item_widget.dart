import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_env.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/network_image_widget.dart';

import '../constants/app_colors.dart';

class RestaurantItemWidget extends StatefulWidget {
  final int id;
  final String name;
  final String image;
  final String location;
  final double? width;
  final double? height;
  final String? distanceKm;
  final String? deliveryMin;
  final String? promotionText;
  final String rating;
  final String? storage_path;
  final bool? is_shadowed;
  final num? serviceStatus;
  final String openTime;
  final String closeTime;

  const RestaurantItemWidget(
      {super.key,
      required this.id,
      required this.name,
      required this.image,
      required this.location,
      required this.distanceKm,
      required this.deliveryMin,
      required this.promotionText,
      required this.rating,
      required this.serviceStatus,
      required this.closeTime,
      required this.openTime,
      this.storage_path,
      this.width,
      this.height,
      this.is_shadowed});

  @override
  State<RestaurantItemWidget> createState() => _RestaurantItemWidgetState();
}

class _RestaurantItemWidgetState extends State<RestaurantItemWidget> {
  late bool _isPreOrder;
  @override
  void initState() {
    _determinePreorderStatus();
    super.initState();
  }

  _determinePreorderStatus() {
    DateTime now = DateTime.now();

    // Format openingTime and closingTime into DateTime objects (today's date with specified time)
    final dateFormate = DateFormat("HH:mm:ss");
    DateTime openTime = dateFormate
        .parse(widget.openTime)
        .copyWith(year: now.year, month: now.month, day: now.day);
    DateTime closeTime = dateFormate
        .parse(widget.closeTime)
        .copyWith(year: now.year, month: now.month, day: now.day);

    // Check if the current time (now) is between openTime and closeTime
    if (now.isAfter(openTime) && now.isBefore(closeTime)) {
      _isPreOrder = false;
      // print("The current time is within opening hours.");
    } else {
      _isPreOrder = true;
      //print("The current time is outside opening hours.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(246, 41, 41, 0.10),
            blurRadius: 30,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            AppRoutes.toRestaurantDetailPage(
                id: widget.id, preOrderStatus: _isPreOrder);
          },
          child: Column(
            children: [
              Stack(
                children: [
                  NetworkImageWidget(
                    //url: "https://mallplusmm.com/storage/menu_items/sm/$image",
                    url:
                        "https://mallplusmm.com/storage/restaurants/sm/${widget.image}",
                    sizeHeight: 161,
                    sizeWidth: double.infinity,
                  ),
                  Positioned(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.promotionText == null
                            ? const SizedBox()
                            : Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryDark1,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  widget.promotionText!,
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
                                widget.rating,
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                  if (_isPreOrder)
                    Positioned.fill(
                        child: Container(
                            color: Colors.black.withOpacity(0.25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Opening time : ${widget.openTime} AM to ${widget.closeTime} PM",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 25),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.primary),
                                  child: SizedBox(
                                    height: 20,
                                    child: Text(
                                      "Pre order",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                )
                              ],
                            ))),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 14,
                                height: 14,
                                child: SvgPicture.asset(
                                  'assets/Icons/location-03.svg',
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.neutral4, BlendMode.srcIn),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                  child: Text(
                                widget.location,
                                style: TextStyle(
                                    fontSize: 10, color: AppColors.neutral4),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    SizedBox(
                                      width: 14,
                                      height: 14,
                                      child: SvgPicture.asset(
                                        'assets/Icons/pin-location.svg',
                                        colorFilter: const ColorFilter.mode(
                                            AppColors.primaryDark1,
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${widget.distanceKm} km",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: AppColors.primaryDark1),
                                      ),
                                    ),
                                  ],
                                )),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
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
                                        "${widget.deliveryMin} min",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: AppColors.green),
                                      ),
                                    ),
                                  ],
                                ))
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
