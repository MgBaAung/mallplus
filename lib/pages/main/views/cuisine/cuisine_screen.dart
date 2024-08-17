import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/main/views/cuisine/controller/cuisine_controller.dart';

import '../../../../utils/widgets/base_view_widget.dart';
import '../../../../utils/widgets/cuisine_item_widget.dart';

class CuisineScreen extends GetView<CuisineController> {
  const CuisineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container();
    return  Obx(
          () => BaseViewWidget(
        onRefresh: controller.onRefresh,
        componentState: controller.componentState,
        is_horizontal: false,
        idDataEmpty:controller.home_data.menuCategories!=null? controller.home_data.menuCategories!.isEmpty:true,
        content: _buildPopularCuisineWidget(context),
      ),
    );
  }

  Widget _buildPopularCuisineWidget(BuildContext context) {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 16),
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // number of items in each row
          mainAxisSpacing: 35, // spacing between rows
          crossAxisSpacing: 24, // spacing between columns
          childAspectRatio: 0.80/1
      ),itemCount: controller.home_data.menuCategories!=null ?controller.home_data.menuCategories!.length:0, itemBuilder: (context,index){
        final menu_categories = controller.home_data.menuCategories![index];
        return CuisineItemWidget(menu: menu_categories);
      }),
    );
  }
}
