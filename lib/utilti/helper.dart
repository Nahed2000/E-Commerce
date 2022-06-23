import 'package:get/get.dart';

import '../core/view_model/auth_model.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
  }

}