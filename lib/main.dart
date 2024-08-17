// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mall_plus_new_customer_app/pages/main/controllers/connectivity_check_controller.dart';

import 'package:mall_plus_new_customer_app/services/local_storage_service.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_route.dart';
import 'firebase_options.dart';

class Initdepends {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Initdepends.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (Platform.isAndroid) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  await LocalStorageServie.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        defaultTransition: Transition.fadeIn,
        title: 'Mall Plus',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        getPages: AppPages.pages,
        initialRoute: AppRoutes.mainPage,
        debugShowCheckedModeBanner: false);
  }
}
