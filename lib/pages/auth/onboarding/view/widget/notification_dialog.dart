import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/controller/auth_controller.dart';
import 'package:mall_plus_new_customer_app/pages/auth/onboarding/controller/notification_controller.dart';

class NotificationPermissionDialog extends StatelessWidget {
  final String title, description;
  const NotificationPermissionDialog({
    required this.title,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<NotificationPermissionController>();
    return Dialog(
      elevation: 0,
      backgroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: Container(
              height: Get.height / 6,
              width: Get.width / 2,
              child: Image(
                image: AssetImage("assets/Images/noti.gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "${title}",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(12),
            child: Text(
              "${description}",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Pyidaungsu", fontSize: 14),
            ),
          ),
          SizedBox(height: 8),
          Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              highlightColor: Colors.grey[200],
              onTap: () {
                controller.requestNotificationPermission();
              },
              child: Center(
                child: Text(
                  "ဖွင့်မည်",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Pyidaungsu",
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              highlightColor: Colors.grey[200],
              onTap: () {
                controller.setdialogdismissed(true);
                Get.back();
              },
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
