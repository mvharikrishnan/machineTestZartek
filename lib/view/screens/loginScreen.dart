import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_machine_test/constants/colors.dart';
import 'package:zartek_machine_test/constants/constants.dart';
import 'package:zartek_machine_test/services/auth_service.dart';
import 'package:zartek_machine_test/view/screens/phoneAuth.dart';
import 'package:zartek_machine_test/view/widgets/login_page_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo/firebaseLogo.png"),
              ],
            ),
            Column(
              children: [
                LoginPageButton(
                  leadingImage: "assets/logo/google_icon.png",
                  tileColor: kBlue,
                  title: "Google",
                  onTap: () async {
                    authClass.googleSignIn(context: context);
                  },
                ),
                Constants.kSizedBoxH10,
                LoginPageButton(
                  leadingImage: "assets/logo/phone_logo.png",
                  tileColor: kGreen,
                  title: "Phone",
                  onTap: () {
                    log("Phone");
                    Get.to(PhoneAuthPage());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
