import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_machine_test/constants/colors.dart';
import 'package:zartek_machine_test/controller/cartController.dart';
import 'package:zartek_machine_test/view/screens/cart_screen/components/carttile.dart';
import 'package:zartek_machine_test/view/widgets/sucessfulDialog.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final cartcontrol = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    cartcontrol.getCartItemsCount();
    cartcontrol.getTotalPrice();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        appBar: AppBar(
          title: Text(
            "Order Summary",
            style: TextStyle(color: kGrey),
          ),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: Get.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 15.w,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 27, 68, 28),
                            ),
                            child: Center(
                              child: Text(
                                  "${cartcontrol.cartItems.length} Dishes - ${cartcontrol.cartItemsCount} Items",
                                  style: TextStyle(
                                      color: kwhite, fontSize: 15.sp)),
                            ),
                          ),
                        ),
                        Obx(
                          () => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 60.h,
                              child: ListView.separated(
                                  itemBuilder: (context, index) =>
                                      CartProductTile(
                                          index: index,
                                          cartmodel:
                                              cartcontrol.cartItems[index]),
                                  separatorBuilder: (context, index) => Divider(
                                        height: 3.w,
                                        thickness: 2,
                                      ),
                                  itemCount: cartcontrol.cartItems.length),
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total Amount",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(() => Text(
                                    "INR ${cartcontrol.cartItemsTotal}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: kGreen),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => showDialogBox(),
                      child: Container(
                        height: 13.w,
                        width: 90.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color.fromARGB(255, 27, 68, 28),
                        ),
                        child: Center(
                            child: Text(
                          "Place Order",
                          style: TextStyle(color: kwhite, fontSize: 17.sp),
                        )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
