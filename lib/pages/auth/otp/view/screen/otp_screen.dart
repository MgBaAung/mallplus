import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/auth/common/widgets/CustomButton.dart';
import 'package:mall_plus_new_customer_app/pages/auth/otp/controller/otp_controller.dart';
import 'package:mall_plus_new_customer_app/pages/auth/common/widgets/auth_header.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_env.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class OtpPage extends GetView<OtpController> {
  OtpPage({super.key});

  late Timer _timer;
  late int seconds;
  bool _expiredCode = false;
  TextEditingController _pinEditingController = TextEditingController();
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    const _kDefaultHint = '------';
    Color _solidColor = Colors.purpleAccent;
    bool _obscureEnable = false;
    bool _solidEnable = false;

    /*
    PinDecoration _pinDecoration = UnderlineDecoration(
      enteredColor: Colors.green,
      hintText: _kDefaultHint,
    );
    */
    PinDecoration _pinDecoration = BoxLooseDecoration(
      //enteredColor: Colors.red,
      //solidColor: _solidEnable ? _solidColor : null,
      
      strokeColorBuilder: PinListenColorBuilder(Colors.cyan, Color(0xffB7B7B7)),
      obscureStyle: ObscureStyle(
        isTextObscure: _obscureEnable,
        obscureText: '☺️',
      ),
      hintText: _kDefaultHint,
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 209,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Header("OTP Code",
            description: "We have sent a 6-digit to your phone"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Obx(() =>  (controller.expiredCode)
            ? const SizedBox()
            : PinInputTextField(
          pinLength: 6,

          //decoration: UnderlineDecoration,
          decoration: _pinDecoration,
          controller: _pinEditingController,
          autoFocus: true,
          textInputAction: TextInputAction.go,
          onSubmit: (pin) async {
            debugPrint('submit pin:$pin');
            //String firebaseToken = await getFirebaseToken();
            // String? firebaseToken =
            // await storage.read(key: 'firebaseToken');
            bool result = await controller.doverifyotp(
                _pinEditingController.text);
            if (result) {
              AppRoutes.offallMainPage();
            } else {
              controller.showWaningMessage(context);
            }
          },
          onChanged: (pin) async {
            if (pin != '') {
              if (pin.length == 6) {
                String? firebaseToken =
                await storage.read(key: 'firebaseToken');
                bool result = await controller.doverifyotp(
                    _pinEditingController.text,);
                if (result) {
                  AppRoutes.offallMainPage();
                } else {
                  controller.showWaningMessage(context);
                }
              }
            }
          },
        )),

                    Obx(() => (controller.expiredCode)
                        ? Column(
                      children: <Widget>[
                        Text(
                          "The sms code has expired.",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                          // style: ButtonStyle(

                          //   splashFactory:
                          // ),
                          style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.padded,
                              padding: EdgeInsets.all(12),
                              textStyle: TextStyle(color: Colors.blue)
                            // disabledColor: Colors.grey,
                            // disabledTextColor: Colors.black,

                            //  splashColor: Colors.redAccent,
                          ),
                          onPressed: () {
                            AppRoutes.offalllogin();
                          },
                          child: Text(
                            "re-send",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: AppEnv.btn_font_size,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    )
                        : Text(controller.time),),
                    const SizedBox(
                      height: 20,
                    ),
                    (controller.expiredCode)
                        ? Container()
                        : CustomButton('Verify', () async {
                      String? firebaseToken =
                      await storage.read(key: 'firebaseToken');
                      bool result = await controller.doverifyotp(
                          _pinEditingController.text,);
                      if (result) {
                        AppRoutes.offallMainPage();
                      } else {
                        controller.showWaningMessage(context);
                      }
                    })
                  ],
                ),
              ),
              Container(height:20,child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't get the otp code?"),
                  GestureDetector(
                    onTap: (){},
                    child: Text('Resend',style: TextStyle(color: Color(0xffB11718)),),
                  )
                ],
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
