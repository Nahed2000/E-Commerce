import 'package:ecommerce/database/controller/db_controller.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    var dbHelper = DbController.db;
    _cartProductModel = await dbHelper.getAllProduct();
    print('methode get ${_cartProductModel.length}');
    _loading.value = false;
    update();
  }

  addProduct({required CartProductModel model}) async {
    var dbHelper = DbController.db;
    await dbHelper.insert(model: model);
    print("methode add task ${_cartProductModel.length}");
    update();
  }
}
