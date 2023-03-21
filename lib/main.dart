import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_machine_test/constants/colors.dart';
import 'package:zartek_machine_test/initial_bindings/bindings.dart';
import 'package:zartek_machine_test/view/screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        theme: ThemeData(
          appBarTheme:  AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            color: kwhite, 
          ),
        ),
        initialBinding: IntialBindings(),
      );
    });
  }
}
