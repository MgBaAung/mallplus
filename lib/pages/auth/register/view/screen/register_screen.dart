import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/auth/common/widgets/CustomInputBox.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';

import '../../controller/register_controller.dart';
import '../../../common/widgets/CustomButton.dart';
import '../../../common/widgets/auth_header.dart';

class Register extends GetView<RegisterController> {
  Register({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Obx(() {
              return controller.isLoading
                  ? const Center(
                      child: SizedBox(),
                    )
                  : ListView(
                      children: [
                        Header("Sign in\nto your account",
                            description:
                                "Sign in to gain to access to acccount"),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 40),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  CustomInputBox(
                                    'Name',
                                    'Enter your name',
                                    image: const AssetImage(
                                        'assets/Icons/user.png'),
                                    controller: nameController,
                                    isprefixtext: false,
                                  ),
                                  SizedBox(height: 10,),
                                  CustomInputBox(
                                    'Phone',
                                    'Enter your phone number',
                                    image: const AssetImage(
                                        'assets/Icons/Call.png'),
                                    controller: phoneController,
                                    type: TextInputType.number,
                                    isprefixtext: true,
                                    prefixtext: "09",
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  CustomButton(
                                    controller.isButtonDisabled
                                        ? "Loading ..."
                                        : "Register account",
                                    controller.isButtonDisabled
                                        ? null
                                        : () {
                                            final form = _formKey.currentState;
                                            if (form!.validate()) {
                                              controller.doLogin(
                                                nameController.text,
                                                  phoneController.text);
                                            }
                                          },
                                  )
                                ],
                              ),
                            )),
                      ],
                    );
            })),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: 181,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(fontSize: 12,fontWeight:FontWeight.w400),),
                  Container(

                    child: GestureDetector(onTap: (){
                      AppRoutes.offalllogin();
                    },child: Text("  Login",style: TextStyle(fontSize: 12,fontWeight:FontWeight.w400,color: AppColors.primaryDark1),),),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {



//   bool _isButtonDisabled = false;
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       _isButtonDisabled = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
    
//   }
// }
