import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_machine_test/constants/colors.dart';
import 'package:zartek_machine_test/controller/homeController.dart';
import 'package:zartek_machine_test/services/auth_service.dart';
import 'package:zartek_machine_test/view/screens/loginScreen.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});
  final HomePageController homePageController = Get.find<HomePageController>();
  @override
  Widget build(BuildContext context) {
    homePageController.getCurrentUser;
    homePageController.getCurrentUserID;
    Map<dynamic, dynamic> _userData = homePageController.userData;
    String uid = homePageController.currentUserid.value;
    return Drawer(
        child: Obx(
      () => Column(
        children: [
          Container(
            height: 25.h,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 5.h,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage("assets/logo/dummy-profile-pic.png"),
                ),
                Text(
                  _userData['googleName'] ??
                      _userData['phoneNumber'] ??
                      " No name",
                  style: TextStyle(
                    fontSize: 5.w,
                    color: kBlack,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ID :",
                      style: TextStyle(
                        fontSize: 5.w,
                        color: kBlack,
                      ),
                    ),
                    Text(
                      uid,
                      style: TextStyle(
                        fontSize: 3.w,
                        color: kBlack,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              AuthClass().signOut();
              Get.off(LoginScreen());
            },
            leading: const Icon(Icons.logout_outlined),
            title: Text(
              "Log Out",
              style: TextStyle(fontSize: 5.w, color: Colors.grey.shade500),
            ),
          )
        ],
      ),
    ));
  }
}
