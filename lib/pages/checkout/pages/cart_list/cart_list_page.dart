import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/resturant_detail_model.dart';
import 'package:mall_plus_new_customer_app/pages/checkout/controllers/cart_controller.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/network_image_widget.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/widgets/small_restaurant_item_widget.dart';

class CatListPage extends GetView<CartController> {
  const CatListPage({super.key});

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
            "Add to Cart",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset("assets/Images/cart.png"),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.cartList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        final item = controller.cartList[index];
                        return CartItemWidget(
                            item: item,
                            removeItem: () => controller.removeItem(item),
                            decreaseQty: () => controller.decreaseQty(item),
                            increaseQty: () => controller.increaseQty(item));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 192,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.shuffledItems.take(5).length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                        itemBuilder: (context, index) {
                          final item = controller.shuffledItems[index];
                          return SmallRestaurantItemWidget(
                              restaurantName: controller
                                      .restaurantDetailModel?.restaurant.name ??
                                  "",
                              foodName: item.name,
                              discount: item.discount,
                              price: item.price,
                              image: item.imageSrc ?? "");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.neutral9, width: 0.5),
                    ),
                    child: SizedBox(
                      height: 22,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "${controller.total} Ks",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      AppRoutes.toOrderPlacePage();
                    },
                    minWidth: double.infinity,
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: AppColors.primary,
                    child: const Text(
                      "Order",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CartItemWidget extends StatefulWidget {
  final MenuItems item;
  final VoidCallback removeItem;
  final VoidCallback decreaseQty;
  final VoidCallback increaseQty;

  const CartItemWidget(
      {super.key,
      required this.item,
      required this.removeItem,
      required this.decreaseQty,
      required this.increaseQty});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  late String name;

  late List<Extra> extraDataWithPrice;
  late List<Extra> extraData;
  late String qty;
  late String amount;
  @override
  void initState() {
    name = widget.item.name;

    extraDataWithPrice = [
      ...widget.item.extra.where((element) => element.price > 0).toList(),
      if ((widget.item.requireExtra?.price ?? 0) > 0 &&
          widget.item.requireExtra != null)
        widget.item.requireExtra!
    ];

    extraData = [
      ...widget.item.extra
          .where((element) => element.price == 0 && element.name.isNotEmpty)
          .toList(),
      if ((widget.item.requireExtra?.price ?? 0) == 0 &&
          widget.item.requireExtra!.name.isNotEmpty)
        widget.item.requireExtra!
    ];
    qty = widget.item.qty.toString();
    amount = _getAmount();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CartItemWidget oldWidget) {
    if (oldWidget.item != widget.item) {
      name = widget.item.name;

      extraDataWithPrice = [
        ...widget.item.extra.where((element) => element.price > 0).toList(),
        if ((widget.item.requireExtra?.price ?? 0) > 0 &&
            widget.item.requireExtra != null)
          widget.item.requireExtra!
      ];

      extraData = [
        ...widget.item.extra
            .where((element) => element.price == 0 && element.name.isNotEmpty)
            .toList(),
        if ((widget.item.requireExtra?.price ?? 0) == 0 &&
            widget.item.requireExtra!.name.isNotEmpty)
          widget.item.requireExtra!
      ];
      qty = widget.item.qty.toString();
      amount = _getAmount();
    }
    super.didUpdateWidget(oldWidget);
  }

  String _getAmount() {
    final totalExtraAmt = widget.item.extra.fold(
        0, (previousValue, element) => previousValue + element.price.toInt());

    String amount = (((widget.item.price - widget.item.discount) +
                totalExtraAmt +
                (widget.item.requireExtra?.price ?? 0) +
                widget.item.packaging) *
            widget.item.qty)
        .toString();
    return amount;
  }

  bool showOther = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(246, 41, 41, 0.10),
            blurRadius: 30,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              NetworkImageWidget(
                url: "",
                sizeHeight: 82,
                sizeWidth: 82,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: SizedBox(
                height: 82,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 24,
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              widget.removeItem();
                            },
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset(
                                'assets/Icons/delete.svg',
                                colorFilter: const ColorFilter.mode(
                                    AppColors.primary, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 20,
                        child: Text(
                          "packing : + ${widget.item.packaging} Ks",
                          style: const TextStyle(color: AppColors.neutral3),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 22,
                          child: Text(
                            "$amount Ks",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                widget.decreaseQty();
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: SvgPicture.asset(
                                    'assets/Icons/remove.svg',
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.neutral9, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 3),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(36),
                                  border: Border.all(
                                      color: AppColors.primary, width: 0.5)),
                              child: SizedBox(
                                height: 20,
                                child: Text(qty),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                widget.increaseQty();
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: SvgPicture.asset(
                                    'assets/Icons/add.svg',
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.neutral9, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
          if (extraData.isNotEmpty)
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 30,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: extraData.length,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      itemBuilder: (context, index) {
                        final data = extraData[index];
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.greenLight9,
                              borderRadius: BorderRadius.circular(5)),
                          alignment: Alignment.center,
                          child: Text(
                            data.name,
                            style: TextStyle(
                                color: AppColors.greenDark2,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                    )),
              ],
            ),
          if (extraDataWithPrice.isNotEmpty)
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      showOther = !showOther;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.neutral9),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("Other ("),
                                Text(
                                  "+${extraDataWithPrice.length}",
                                  style:
                                      const TextStyle(color: AppColors.primary),
                                ),
                                Text(")"),
                              ],
                            ),
                            Text(
                              showOther ? "Close" : "View",
                              style: TextStyle(color: AppColors.primary),
                            )
                          ],
                        ),
                        if (showOther)
                          ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 10),
                            itemCount: extraDataWithPrice.length,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (context, index) {
                              final data = extraDataWithPrice[index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(data.name),
                                  Text("+ ${data.price}")
                                ],
                              );
                            },
                          )
                      ],
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
