import 'package:ecommerce/core/view_model/home_view_model.dart';
import 'package:ecommerce/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/view_model/auth_model.dart';
import 'home_screen.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? GetBuilder<HomeViewModel>(
              init: HomeViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bNBar(),
              ),
            )
          : LoginView();
    });
  }

  Widget bNBar() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => BottomNavigationBar(
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeIndex(index: index);
          print(index);
        },
        elevation: 0,
        backgroundColor: Colors.grey.shade50,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/Icon_Explore.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
            label: '',
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text('Explore'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/Icon_Cart.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
            label: '',
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text('Cart'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/Icon_User.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
            label: '',
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text('User'),
            ),
          )
        ],
      ),
    );
  }
}
