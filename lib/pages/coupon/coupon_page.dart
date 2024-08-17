import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/models/coupon_list_model.dart';
import 'package:mall_plus_new_customer_app/pages/coupon/controller/coupon_controller.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/base_view_widget.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/network_image_widget.dart';
import 'package:mall_plus_new_customer_app/utils/widgets/search_widget.dart';

import '../../utils/widgets/back_widget.dart';
class CouponPage extends GetView<CouponController> {
  const CouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: CustomBackButton(),
          title: Text("Promotions",style: TextStyle(fontSize: 16,fontWeight:
          FontWeight.w600),),
          centerTitle: true,
        ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        child: Column(children: [

          SearchWidget(hinttext: "Search coupon", icon_path: 'assets/Icons/filter-icon.svg', onChange: (String value) {  },),

          Obx((){
            return BaseViewWidget(
              onRefresh: controller.onRefresh,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.7,
              componentState: controller.componentState,
              idDataEmpty: controller.coupons.isEmpty,
              content: Container(
                width: Get.size.width,
                height: Get.size.height,
                margin: EdgeInsets.only(top: 20),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.coupons.length,
                  itemBuilder: (context,index){
                    final coupon = controller.coupons[index];
                    return _buildCoupon(context,coupon: coupon);
                },),
              ),
            );
        }),]),
      )
    );
  }
  // Widget _buildCoupon(BuildContext context,{required String image, required String title,required String shortdescript,required String endtime}){
    Widget _buildCoupon(BuildContext context,{required Coupon coupon}){
    return Row(
      children: [
        SvgPicture.asset('assets/Images/coupondesign.svg',width: MediaQuery.of(context).size.width*0.6,height: 88,),
        Container(
          // child: Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Container(
          //       margin: EdgeInsets.only(top: 16),
          //       width: MediaQuery.of(context).size.width*0.65,
          //       height: 88,
          //       // color: Colors.blue,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
                    // Text("${coupon.title!}",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w300,fontSize: 16),),
                    // Text("${coupon.short_description}",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w400,fontSize: 8),),
                    // Container(
                    //   width: double.infinity,
                    //   height: 36,
                    //   padding: EdgeInsets.symmetric(horizontal: 5),
                    //   decoration:BoxDecoration(
                    //     color: AppColors.primaryDark5,
                    //     borderRadius: BorderRadius.circular(5)
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       SizedBox(width: 49,height:28,child: Text("discount coupon", softWrap: true,style: TextStyle(color: AppColors.primaryLight9,fontWeight:FontWeight.w700,fontSize: 11, height: 1.2),)),
          //       Container(width: 85,height: 21,child: Text(coupon.discount_amount!=null? "${coupon.discount_amount} mmk OFF":"${coupon.discount_percent}% OFF",overflow: TextOverflow.ellipsis,style: TextStyle(color: AppColors.primaryLight9,fontWeight:FontWeight.w700,fontSize: 16),),)
                    //     ],
                    //   ),
                    // )
              //     ],
              //   ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.3,
                height: 87,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(width: 85,height: 21,child: Text(coupon.discount_amount!=null? "${coupon.discount_amount} mmk":"${coupon.discount_percent}% OFF",overflow: TextOverflow.ellipsis,style: TextStyle(color: AppColors.primaryDark5,fontWeight:FontWeight.w400,fontSize: 10),),),
                    GestureDetector(
                      // onTap: () {
                      //   AppRoutes.toLocationPlacePicker(action: "SAVE_SUITABLE");
                      // },
                      child: Container(width: MediaQuery.of(context).size.width,height: 44,decoration: BoxDecoration(
                          color:AppColors.primary,
                          borderRadius: BorderRadius.circular(4)
                      ),margin: EdgeInsets.symmetric(horizontal: 15),child: Center(child: Text('Use Coupon',style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w400),))),
                    ),
                  ],
                )
                // color:Colors.black
              )
          //   ],
          // ),
        // )
        // Container(
        //   child: Row(
        //     children: [
        //       ClipRRect(borderRadius:BorderRadius.circular(15),child: NetworkImageWidget(url: "https://mallplusmm.com$image",sizeWidth: 84,sizeHeight: 84,)),
        //       SizedBox(width: 10,),
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(title,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,),),
        //           Text(shortdescript,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
        //            Container(
        //              width: MediaQuery.of(context).size.width*0.6,
        //              child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Container(
        //                     width: 112,
        //                     child: Row(
        //                       children: [
        //                         SvgPicture.asset('assets/Icons/clock.svg'),
        //                         SizedBox(width: 10,),
        //                         Text("Exp : $endtime",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color:AppColors.greenDark2),),
        //                       ],
        //                     ),
        //                   ),GestureDetector(onTap: (){},child: Text("view all",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xFF2E3FE8)),))
        //                 ],
        //               ),
        //            ),
        //
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
