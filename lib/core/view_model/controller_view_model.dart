import 'package:ecommerce/view/cart_screen.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:ecommerce/view/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControllerViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget currentScreen = HomeScreen();

  get navigatorValue => _navigatorValue;

  void changeIndex({required int index}) {
    _navigatorValue = index;
    switch (index) {
      case 0:
        currentScreen = HomeScreen();
        break;
      case 1:
        currentScreen = const CartScreen();
        break;
      case 2:
        currentScreen = const UserScreen();
        break;
    }
    update();
  }
}
