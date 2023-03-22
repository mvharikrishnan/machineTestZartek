import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  RxMap<dynamic, dynamic> userData = {}.obs;
  RxString currentUserid = "90099".obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
    getCurrentUser();
    getCurrentUserID();
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

  getCurrentUser() async {
    final user = _auth.currentUser;
    log("Get Current User Called");
    final googleName = await getGoogleName() ?? '';
    final phoneNumber = user?.phoneNumber ?? '';
    userData.value = {'phoneNumber': phoneNumber, 'googleName': googleName};
    log(userData.value.toString());
  }

  Future<String?> getGoogleName() async {
    final user = await _googleSignIn.signInSilently();
    return user?.displayName;
  }

  getCurrentUserID() async {
    final user = _auth.currentUser;
    currentUserid.value = user?.uid ?? "UID";
    log("UID $currentUserid");
  }
}
