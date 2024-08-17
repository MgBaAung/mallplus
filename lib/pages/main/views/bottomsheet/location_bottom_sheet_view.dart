import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';

import '../../../../models/user_address_model.dart';
import '../../controllers/main_controller.dart';

class LocationBottomSheet extends StatelessWidget {
  List<UserAddress> addresses;
  MainController controller = Get.find();
  LocationBottomSheet({super.key,required this.addresses});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      height: MediaQuery.of(context).size.height*0.85,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text(
              'Choose Location',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Obx(() =>_buildLocationList(context, controller.nearestAddress)),
            GestureDetector(
              onTap: () {
                AppRoutes.toLocationPlacePicker(action: "SAVE_SUITABLE");
              },
              child: Container(width: MediaQuery.of(context).size.width,height: 44,decoration: BoxDecoration(
                color:AppColors.primary,
                borderRadius: BorderRadius.circular(8)
              ),margin: EdgeInsets.symmetric(horizontal: 15),child: Center(child: Text('Add New Address',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationList(BuildContext context,UserAddress selected){
    return Container(
      height: MediaQuery.of(context).size.height*0.6,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: addresses.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildLocationOption('Deliver Now : ${addresses[index].title}', addresses[index],index,controller.nearestAddress);
        },
      ),
    );
  }

  Widget _buildLocationOption(String title,UserAddress address, int index, UserAddress selected) {
    print(address);
    return GestureDetector(
      onTap: (){controller.onLocationChange(address);controller.onRefresh();Get.back();},
      child: Container(
        // color: ,
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.neutral9,width: 0.5)
        ),
        child: Center(
          child: Container(
            width: 336,
            height: 58,
            child: Column(
              children: [
                SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 283,
                            height: 58,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/Icons/location-03.svg'),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 254,
                                  height: 40,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        title,
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        // "latitude : ${address.latitude!.toStringAsFixed(6)}, longitude: ${address.longitude!.toStringAsFixed(6)}",
                                        address.address == "" && address.address_detail == "" && address.floor == "" ? "Current Location":"addresss : ${address.address=='' || address.address=="-"?'':address.address} ${address.address_detail??""} ${address.floor??""}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            width: 20,
                            height: 20,
                            child:Radio(value: address, onChanged: (value){}, groupValue: selected,)
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );}
}
