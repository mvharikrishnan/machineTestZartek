import 'package:zartek_machine_test/model/categoryDishModel.dart';

class CartModel {
  CartModel(
      {required this.productItem, required this.count, required this.dishid});
  CategoryDish productItem;
  int count;
  String dishid;
}
