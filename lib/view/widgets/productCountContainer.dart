import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_machine_test/constants/colors.dart';
import 'package:zartek_machine_test/controller/cartController.dart';

import 'package:zartek_machine_test/model/categoryDishModel.dart';

class productCountContainer extends StatelessWidget {
  productCountContainer({
    super.key,
    required this.categoryDish,
    required this.color,
  });
  final CategoryDish categoryDish;
  final Color color;

  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    final int cartCount =
        cartController.getInividualCound(categoryDish: categoryDish);
    return Container(
      height: 10.w,
      width: 28.w,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  cartController.removeFromCart(categoryDish: categoryDish);
                  cartController.getCartItemsCount();
                },
                icon: Icon(
                  Icons.remove,
                  color: kwhite,
                )),
            Text(
              cartCount.toString(),
              style: TextStyle(color: kwhite),
            ),
            IconButton(
                onPressed: () {
                  cartController.addItemToCart(
                    categoryDish: categoryDish,
                  );
                  cartController.getCartItemsCount();
                },
                icon: Icon(Icons.add, color: kwhite)),
          ],
        ),
      ),
    );
  }
}
