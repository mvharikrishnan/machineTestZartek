import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:zartek_machine_test/controller/cartController.dart';
import 'package:zartek_machine_test/model/cartModel.dart';
import 'package:zartek_machine_test/view/widgets/productCountContainer.dart';

class CartProductTile extends StatelessWidget {
  CartProductTile({super.key, required this.index, required this.cartmodel});
  final CartModel cartmodel;
  final cartControl = Get.find<CartController>();
  final int index;
  @override
  Widget build(BuildContext context) {
    final int cartCount =
        cartControl.getInividualCound(categoryDish: cartmodel.productItem);
    final double totalPrice = cartmodel.productItem.dishPrice * cartCount;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cartmodel.productItem.dishType == 2
                ? Image.asset(
                    "assets/logo/veg.png",
                    height: 6.w,
                  )
                : Image.asset(
                    "assets/logo/nonveg.png",
                    height: 6.w,
                  ),
            SizedBox(
              width: 1.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 35.w,
                  child: Text(
                    cartmodel.productItem.dishName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text("INR ${cartmodel.productItem.dishPrice.toString()}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12.sp)),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                    "${cartmodel.productItem.dishCalories.toString()} calories",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12.sp)),
              ],
            ),
          ],
        ),
        productCountContainer(
          categoryDish: cartmodel.productItem,
          color: const Color.fromARGB(255, 27, 68, 28),
        ),
        Text("INR $totalPrice",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp))
      ],
    );
  }
}
