import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_machine_test/controller/cartController.dart';
import 'package:zartek_machine_test/view/screens/home_screen/home_screen.dart';

void showDialogBox() {
  final CartController cartController = Get.find<CartController>();
  Get.defaultDialog(
    title: "Order successfully placed",
    content: const Text("Your order will be processing shortly"),
    textCancel: "Cancel",
    textConfirm: "Confirm",
    onConfirm: () {
      cartController.orderPlaced();
      Get.to(HomeScreen());
    },
    onCancel: () {
      // Handle cancellation
      Get.back();
    },
  );
}
