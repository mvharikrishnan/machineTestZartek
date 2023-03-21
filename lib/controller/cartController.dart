import 'dart:developer';

import 'package:get/get.dart';
import 'package:zartek_machine_test/model/cartModel.dart';
import 'package:zartek_machine_test/model/categoryDishModel.dart';

class CartController extends GetxController {
  RxList<CartModel> cartItems = <CartModel>[].obs;
  RxInt cartItemsCount = 0.obs;
  RxDouble cartItemsTotal = 0.0.obs;
  RxInt totalAmount = 0.obs;
  RxInt returnint = 0.obs;

  addItemToCart({required CategoryDish categoryDish}) async {
    log("Adding started");

    if (cartItems.any((element) => element.dishid == categoryDish.dishId)) {
      for (int i = 0; i < cartItems.length; i++) {
        if (cartItems[i].dishid == categoryDish.dishId) {
          // Increment the count of the existing CartModel instance
          cartItems[i].count++;
          getTotalPrice();
          getCartItemsCount();
          update();
          break;
        }
      }
      log("Count+++ done");
    } else {
      cartItems.add(CartModel(
        productItem: categoryDish,
        count: 1,
        dishid: categoryDish.dishId,
      ));
      getCartItemsCount();
    }
    log("Adding Ended");
  }

  orderPlaced(){
    cartItems.clear();
  }

  removeFromCart({required CategoryDish categoryDish}) {
    if (cartItems.any((element) => element.dishid == categoryDish.dishId)) {
      for (int i = 0; i < cartItems.length; i++) {
        if (cartItems[i].dishid == categoryDish.dishId) {
          // decrement the count of the existing CartModel instance
          if (cartItems[i].count == 1) {
            cartItems.removeAt(i);
            getTotalPrice();
            getCartItemsCount();
            update();
          } else {
            cartItems[i].count--;
            getTotalPrice();
            getCartItemsCount();
            update();
          }

          break;
        }
      }
    }
  }

  getCartItemsCount() {
    cartItemsCount.value = 0;
    for (int i = 0; i < cartItems.length; i++) {
      cartItemsCount.value = cartItems[i].count + cartItemsCount.value;
    }
  }

  getTotalPrice() {
    cartItemsTotal.value = 0.0;
    for (int i = 0; i < cartItems.length; i++) {
      cartItemsTotal.value =
          cartItems[i].count * cartItems[i].productItem.dishPrice +
              cartItemsTotal.value;
    }
  }

  int getInividualCound({required CategoryDish categoryDish}) {
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].dishid == categoryDish.dishId) {
        return cartItems[i].count;
      }
    }
    return 0;
  }
}
