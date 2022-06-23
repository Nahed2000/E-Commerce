import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/view_model/auth_model.dart';


class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthViewModel>(
        init: AuthViewModel(),
        builder: (controller) {
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              //ElevatedButton(
                //  onPressed: () => controller.increaseCounter(),
                  //child: Text('${controller.counter}'))
            ],
          ));
        },
      ),
    );
  }
}
