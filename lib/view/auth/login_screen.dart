import 'package:ecommerce/constance.dart';
import 'package:ecommerce/view/auth/register_view.dart';
import 'package:ecommerce/view/widget/custom_bottun.dart';
import 'package:ecommerce/view/widget/custom_button_social.dart';
import 'package:ecommerce/view/widget/custom_form_field.dart';
import 'package:ecommerce/view/widget/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/view_model/auth_model.dart';

class LoginView extends GetWidget<AuthViewModel> {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 35),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const CustomText(text: 'Welcome,', fontSize: 30),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: const CustomText(
                        text: 'SignUp',
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const CustomText(
                    text: 'SignIn to Continue ',
                    fontSize: 16,
                    color: Colors.grey),
                const SizedBox(height: 48),
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
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      return '';
                    }
                  },
                ),
                const SizedBox(height: 15),
                const CustomText(
                  text: 'Forget Password ?',
                  color: Colors.grey,
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'SING IN',
                  height: 50,
                  onPressed: () {
                    formKey.currentState!.save();
                    print('wee  **  here');
                    controller.signInWithEmailAndPassword();
                    if (formKey.currentState!.validate()) {
                      print('wee      here');
                    }
                  },
                ),
                const SizedBox(height: 40),
                const CustomText(
                  text: '-OR-',
                  fontSize: 20,
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 40),
                CustomButtonSocial(
                  onPressed: () => controller.facebookSignInMethode(),
                  text: 'Sign In with FaceBook',
                  imageName: 'assets/images/Icon_Facebook.png',
                ),
                const SizedBox(height: 20),
                CustomButtonSocial(
                  onPressed: () => controller.googleSingINMethode(),
                  imageName: 'assets/images/icons8_Google_2.png',
                  text: 'Sign In with Google',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
