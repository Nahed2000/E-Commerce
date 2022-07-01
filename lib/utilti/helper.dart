import 'package:ecommerce/core/view_model/controller_view_model.dart';
import 'package:ecommerce/core/view_model/home_view_model.dart';
import 'package:get/get.dart';

import '../core/view_model/auth_model.dart';
import '../core/view_model/cart_view_model.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControllerViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
  }

}