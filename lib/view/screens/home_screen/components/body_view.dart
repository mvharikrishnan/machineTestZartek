import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zartek_machine_test/controller/homeController.dart';
import 'package:zartek_machine_test/view/screens/home_screen/components/productTile.dart';

class BodyViewWidget extends StatelessWidget {
  BodyViewWidget({
    super.key,
  });

  final homePageController = Get.find<HomePageController>();
  @override
  Widget build(BuildContext context) {
    // homePageController.fetchCategoryList();
    // log("${homePageController.currentTabIndex.value}");
    return Obx(
      () => homePageController.isFiltered.value
          ? const Center(child: Text("filtering"))
          : Obx(() => ListView.separated(
                itemCount: homePageController.categoryDishList.length,
                itemBuilder: (context, index) => ProductTile(
                    tableMenuList:
                        homePageController.fetchedList[0].tableMenuList[index],
                    categoryDish: homePageController
                            .fetchedList[0].tableMenuList[index].categoryDishes[
                        homePageController.currentTabIndex.value]),
                separatorBuilder: (context, index) => const Divider(
                  height: 5,
                ),
              )),
    );
  }
}


// ListView.separated(
//       itemCount: homePageController.fetchedList[0].tableMenuList[currentIndex].categoryDishes.length,
//       itemBuilder: (context, index) => ProductTile(
//           categoryDishModel: homePageController
//               .fetchedList[0].tableMenuList[currentIndex].categoryDishes[index]),
//       separatorBuilder: (context, index) => const Divider(
//         height: 2,
//       ),
//     );