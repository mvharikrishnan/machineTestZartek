import 'package:get/get.dart';
import 'package:zartek_machine_test/controller/cartController.dart';
import 'package:zartek_machine_test/controller/homeController.dart';

class IntialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomePageController>(HomePageController());
    Get.put<CartController>(CartController());
  }
}
