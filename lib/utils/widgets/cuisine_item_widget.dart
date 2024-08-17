import 'package:flutter/material.dart';
import 'package:mall_plus_new_customer_app/models/menu_categories_model.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';

import 'network_image_widget.dart';
class CuisineItemWidget extends StatelessWidget {
  MenuCategories menu;
  CuisineItemWidget({super.key,required this.menu});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){AppRoutes.offfilteredrestaurant(menu_id: menu.id!,menu: menu.name!);},
      child: Container(
        width: 83,
        height: 113,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),child: Container(width:83,height:83,child: NetworkImageWidget(url:"https://mallplusmm.com/storage/cuisines/sm/${menu.image!}",sizeHeight: 83,sizeWidth: 83,fit: BoxFit.cover,))),
            ),
            Text(menu.name!,overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
