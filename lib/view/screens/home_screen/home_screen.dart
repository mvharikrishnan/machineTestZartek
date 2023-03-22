import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_machine_test/constants/colors.dart';
import 'package:zartek_machine_test/constants/constants.dart';
import 'package:zartek_machine_test/controller/homeController.dart';
import 'package:zartek_machine_test/view/screens/cart_screen/cart_screen.dart';
import 'package:zartek_machine_test/view/screens/home_screen/components/body_view.dart';

import 'package:zartek_machine_test/view/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomePageController homePageController = Get.find<HomePageController>();
  @override
  Widget build(BuildContext context) {
    homePageController.getdata();
    // homePageController.getCurrentUser;
    // homePageController.getCurrentUserID;
    return Obx(() => homePageController.isLoading.value
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined),
                )
              ],
            ),
            // body: Body(),
            drawer: DrawerWidget(),
          )
        : DefaultTabController(
            length: homePageController.tableMenuTitleList.length,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                bottom: PreferredSize(
                  preferredSize: Size(Get.width, 30),
                  child: TabBar(
                      onTap: (value) {
                        homePageController.currentTabIndex.value = value;
                        homePageController.fetchCategoryList();
                      },
                      isScrollable: true,
                      labelColor: kRed,
                      unselectedLabelColor: kGrey,
                      indicatorColor: kRed,
                      tabs: homePageController.tableMenuTitleList
                          .map((label) =>
                              Tab(child: Text(label, style: tabBarTextStyle)))
                          .toList()),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      log("Cart Button Pressed");
                      Get.to(() => CartScreen());
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  )
                ],
              ),
              body: TabBarView(
                children: homePageController.tableMenuTitleList.map((_) {
                  return BodyViewWidget();
                }).toList(),
              ),
              drawer: DrawerWidget(),
            ),
          ));
  }
}
