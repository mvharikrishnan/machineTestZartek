import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_machine_test/constants/colors.dart';
import 'package:zartek_machine_test/controller/cartController.dart';
import 'package:zartek_machine_test/controller/homeController.dart';
import 'package:zartek_machine_test/model/categoryDishModel.dart';
import 'package:zartek_machine_test/model/tabelMenuListModel.dart';
import 'package:zartek_machine_test/view/widgets/productCountContainer.dart';

class ProductTile extends StatelessWidget {
  ProductTile(
      {required this.tableMenuList, required this.categoryDish, super.key});
  final TableMenuList tableMenuList;
  final CategoryDish categoryDish;
  final homeController = Get.find<HomePageController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              tableMenuList.categoryDishes[homeController.currentTabIndex.value]
                          .dishType ==
                      2
                  ? Image.asset(
                      "assets/logo/veg.png",
                      height: 6.w,
                    )
                  : Image.asset(
                      "assets/logo/nonveg.png",
                      height: 6.w,
                    ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: SizedBox(
              width: 70.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    tableMenuList
                        .categoryDishes[homeController.currentTabIndex.value]
                        .dishName,
                    style:
                        TextStyle(fontSize: 4.w, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 1.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "INR ${tableMenuList.categoryDishes[homeController.currentTabIndex.value].dishPrice}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        "${tableMenuList.categoryDishes[homeController.currentTabIndex.value].dishCalories.toInt()} calories",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.w,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      tableMenuList
                          .categoryDishes[homeController.currentTabIndex.value]
                          .dishDescription,
                      style: TextStyle(color: kGrey),
                    ),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  productCountContainer(
                    categoryDish: categoryDish,
                    color: kGreen,
                  ),
                  SizedBox(
                    height: 1.w,
                  ),
                  tableMenuList
                          .categoryDishes[homeController.currentTabIndex.value]
                          .addonCat!
                          .isNotEmpty
                      ? Text(
                          "Customization Available",
                          style: TextStyle(color: kRed),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 15.w,
                width: 15.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://i.pinimg.com/736x/fb/00/e3/fb00e36f59de39123ca5446960a0b625.jpg"))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
