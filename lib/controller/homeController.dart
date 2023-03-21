import 'dart:developer';

import 'package:get/get.dart';
import 'package:zartek_machine_test/model/categoryDishModel.dart';
import 'package:zartek_machine_test/model/productModel.dart';

import 'package:zartek_machine_test/services/services.dart';

class HomePageController extends GetxController {
  List<ProductModel> fetchedList = <ProductModel>[];
  List<String> tableMenuTitleList = <String>[];
  List<CategoryDish> categoryDishList = <CategoryDish>[].obs;
  RxInt currentTabIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isFiltered = false.obs;

  Services services = Services();
  getdata() async {
    try {
      fetchedList.clear();
      log("Fetching Started");
      isLoading.value = true;
      var data = await services.fetchData();
      fetchedList = data;
      getTabTitles();
      log("Fetching Ended");
    } catch (e) {
      log("Error WHile");
    }
  }

  getTabTitles() {
    tableMenuTitleList.clear();
    for (var product in fetchedList) {
      for (var item in product.tableMenuList) {
        tableMenuTitleList.add(item.menuCategory);
      }
    }
    log("TAB NAMES ---> $tableMenuTitleList");
    isLoading.value = false;
    fetchCategoryList();
  }

  fetchCategoryList() {
    isFiltered.value = true;
    categoryDishList.clear();
    for (var item
        in fetchedList[0].tableMenuList[currentTabIndex.value].categoryDishes) {
      categoryDishList.add(item);
    }
    isFiltered.value = false;
  }
}
