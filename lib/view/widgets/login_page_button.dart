import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_machine_test/constants/colors.dart';

class LoginPageButton extends StatelessWidget {
  const LoginPageButton({
    super.key,
    required this.leadingImage,
    required this.tileColor,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Color tileColor;
  final String leadingImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 17.w,
          width: 90.w,
          decoration: BoxDecoration(
            color: tileColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 20,
                child: Image.asset(
                  leadingImage,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: kwhite),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )),
    );
  }
}
