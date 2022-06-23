

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/view_model/auth_model.dart';
import '../widget/custom_bottun.dart';
import '../widget/custom_form_field.dart';
import '../widget/custome_text.dart';

class RegisterView extends GetWidget<AuthViewModel> {
   RegisterView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed:()=> Get.back(),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 35),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomText(
                text: 'Sign Up',
                fontSize: 35,
                color: Colors.black,
              ),
                const SizedBox(height: 48),
                CustomFormField(
                  text: 'Name',
                  hint: 'Enter Your Name .!',
                  onSaved: (value) {
                    controller.name = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter Name';
                    }
                    return '';
                  },
                ),
                const SizedBox(height: 40),
                CustomFormField(
                  text: 'Email',
                  hint: 'exzample@gmail.com',
                  onSaved: (value) {
                    controller.email = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter password';
                    }
                    return '';
                  },
                ),
                const SizedBox(height: 40),
                CustomFormField(
                  text: 'Password',
                  hint: 'enter your password',
                  onSaved: (value) {
                    controller.password = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter password';
                    }
                    return '';
                  },
                ),
                const SizedBox(height: 15),
                CustomButton(
                  text: 'Sign Up',
                  height: 50,
                  onPressed: () {
                    formKey.currentState!.save();
                    print('wee  **  here');
                    controller.createAccountWithEmailAndPassword();
                    if (formKey.currentState!.validate()) {
                      print('wee   --  here');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
