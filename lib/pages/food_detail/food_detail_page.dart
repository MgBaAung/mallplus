import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/resturant_detail_model.dart';
import 'package:mall_plus_new_customer_app/pages/food_detail/controllers/food_detail_controller.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/network_image_widget.dart';

class FoodDetailPage extends GetView<FoodDetailController> {
  const FoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final item = controller.item;
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Food Detail",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: NetworkImageWidget(
                    url:
                        "https://mallplusmm.com/storage/restaurants/sm/${item.imageSrc ?? ""}",
                    sizeHeight: 161,
                    sizeWidth: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 24,
                  child: Text(
                    item.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      if (item.discount != 0)
                        Row(
                          children: [
                            Text(
                              (item.price - item.discount).toString(),
                              style: const TextStyle(
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
                        "${item.price} ks",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  item.description ?? "",
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 24,
                ),
                _optionsWidget(item)
              ],
            ),
          ),
          Column(
            children: [
              Container(
                color: const Color(0xffD5D9FA),
                padding: const EdgeInsets.all(16),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 22,
                          child: Text("Price  : ${controller.total} KS")),
                      Row(
                        children: [
                          InkWell(
                            onTap: controller.decreaseQty,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                  'assets/Icons/remove.svg',
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
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
                                height: 20, child: Text(controller.quantity)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: controller.increaseQty,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                  'assets/Icons/add.svg',
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          onPressed: controller.addToCart,
                          style: ButtonStyle(
                              foregroundColor: const MaterialStatePropertyAll(
                                  AppColors.primary),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              side: const MaterialStatePropertyAll(
                                  BorderSide(color: AppColors.primary))),
                          child: const Text("Add to cart")),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: MaterialButton(
                      color: AppColors.primary,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {
                        controller.orderNow();
                      },
                      child: const Text("Order Now"),
                    ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _optionsWidget(MenuItems item) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: item.options.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15,
        );
      },
      itemBuilder: (context, index) {
        final option = item.options[index];

        return (option.type == "radio")
            //? _radioSelectWidget(option)
            ? RequireExtraSelectionWidget(
                option: option, controller: controller)
            : OptionalExtraSelectionWidget(
                option: option,
                toggleAddOptionalExtra: controller.toggleAddOptionalExtra,
                optionalExtras: controller.optionalExtras,
              );
      },
    );
  }

  // Widget _radioSelectWidget(Options option) {
  //   return RequireExtraSelectionWidget(controller: controller);
  // }
}

class RequireExtraSelectionWidget extends StatefulWidget {
  final Options option;
  final FoodDetailController controller;
  const RequireExtraSelectionWidget({
    super.key,
    required this.option,
    required this.controller,
  });

  @override
  State<RequireExtraSelectionWidget> createState() =>
      _RequireExtraSelectionWidgetState();
}

class _RequireExtraSelectionWidgetState
    extends State<RequireExtraSelectionWidget> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.option.title ?? "",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 11,
            ),
            Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.primaryLight8,
                    borderRadius: BorderRadius.circular(11)),
                child: const Text(
                  "Required",
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary),
                )),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _showMore
                  ? widget.option.children.length
                  : widget.option.children.length >= 3
                      ? 3
                      : widget.option.children.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) {
                final extra = widget.option.children[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => widget.controller.setSelectedRequireExtra(extra),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 11),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE7E7E7)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => SizedBox(
                              height: 20,
                              width: 20,
                              child: Radio(
                                value: extra,
                                groupValue:
                                    widget.controller.selectedRequireExtra,
                                onChanged: (value) {},
                              )),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(extra.name),
                            Text("${extra.price} Ks")
                          ],
                        ))
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            if (widget.option.children.length > 3)
              InkWell(
                onTap: () {
                  setState(() {
                    _showMore = !_showMore;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.primaryLight9,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Text(
                    _showMore ? "See less" : "See more",
                    // controller.showAllExtras ? 'Show Less' : 'View More',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}

class OptionalExtraSelectionWidget extends StatefulWidget {
  final Options option;
  final Function(Extra data) toggleAddOptionalExtra;
  final List<Extra> optionalExtras;
  const OptionalExtraSelectionWidget(
      {super.key,
      required this.option,
      required this.toggleAddOptionalExtra,
      required this.optionalExtras});

  @override
  State<OptionalExtraSelectionWidget> createState() =>
      _OptionalExtraSelectionWidgetState();
}

class _OptionalExtraSelectionWidgetState
    extends State<OptionalExtraSelectionWidget> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              widget.option.title ?? "",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 11,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color(0xffD4FADF),
                  borderRadius: BorderRadius.circular(11)),
              child: const Text(
                "Optional",
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                    color: AppColors.green),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _showMore
                  ? widget.option.children.length
                  : widget.option.children.length >= 3
                      ? 3
                      : widget.option.children.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) {
                final extra = widget.option.children[index];
                return InkWell(
                  onTap: () => widget.toggleAddOptionalExtra(extra),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 11),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE7E7E7)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => SizedBox(
                            height: 20,
                            width: 20,
                            child: Checkbox(
                              value: widget.optionalExtras.contains(extra),
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(extra.name),
                            Text("${extra.price} Ks")
                          ],
                        ))
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            if (widget.option.children.length > 3)
              InkWell(
                onTap: () {
                  setState(() {
                    _showMore = !_showMore;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.primaryLight9,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Text(
                    _showMore ? "See less" : "See more",
                    // controller.showAllExtras ? 'Show Less' : 'View More',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}
