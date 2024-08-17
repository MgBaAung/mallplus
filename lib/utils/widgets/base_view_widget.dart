import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/resturant/controller/resturant_controller.dart';

import '../constants/constants.dart';

class BaseViewWidget extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final ComponentState componentState;
  final Widget? loadingWidget;
  final double? width,height;
  final bool idDataEmpty;
  final bool? is_horizontal;
  final Widget errorWidget;
  final Widget content;

  const BaseViewWidget({
    this.width,
    this.height,
    required this.onRefresh,
    required this.componentState,
    this.loadingWidget,
    this.errorWidget = const SizedBox(),
    this.idDataEmpty = false,
    required this.content,
    this.is_horizontal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget displayWidget;

    switch (componentState) {
      case ComponentState.LOADING:
        displayWidget = loadingWidget??Container(width: width??null,height: height??null,child:Center(child: CircularProgressIndicator.adaptive()));
        break;
      case ComponentState.LOADED:
        displayWidget = RefreshIndicator(
          onRefresh: onRefresh,
          child: SizedBox(
            width: width??null,
            height: height??null,
            child: ListView(
              scrollDirection: is_horizontal != null && is_horizontal!? Axis.horizontal:Axis.vertical,
              children: [
                idDataEmpty
                    ? SizedBox(
                        height: Get.size.height * 0.7,
                        child: const Center(
                          child: Text(
                            "Empty!",
                            //style: AppTextStyles.navBold,
                          ),
                        ),
                      )
                    : content,
              ],
            ),
          ),
        );
        break;
      case ComponentState.ERROR:
        displayWidget = errorWidget;
        break;
    }
    return displayWidget;
  }
}
