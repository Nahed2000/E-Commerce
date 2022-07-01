import 'package:ecommerce/database/controller/db_controller.dart';
import 'package:ecommerce/utilti/helper.dart';
import 'package:ecommerce/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'view/auth/login_screen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbController.db.initDatabase();
  await Firebase.initializeApp();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home:  const ControlView(),
    );
  }
}
