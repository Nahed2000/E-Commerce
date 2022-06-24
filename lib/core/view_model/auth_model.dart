import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/service/firesrore_user.dart';
import 'package:ecommerce/view/auth/test_screen.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();
  String? email;

  String? password;

  String? nameUser;

  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void googleSingINMethode() async {
    final GoogleSignInAccount? userAccount = await _googleSignIn.signIn();
    print(userAccount);
    GoogleSignInAuthentication googleSignInAuthentication =
        await userAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> facebookSignInMethode() async {
    FacebookLoginResult result =
        await _facebookLogin.logIn(permissions: [FacebookPermission.email]);
    final accessToken = result.accessToken!.token;
    if (result.status == FacebookLoginStatus.success) {
      final AuthCredential credential =
          FacebookAuthProvider.credential(accessToken);
      await _firebaseAuth.signInWithCredential(credential);
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email ?? 'test', password: password ?? 'test');
      Get.offAll(const HomeScreen());
      print('sign in success');
    } catch (e) {
      print('we error');
      Get.snackbar('Error login account', e.toString(),
          colorText: Colors.black87,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red);
    }
  }

  Future<void> createAccountWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: email ?? 'test', password: password ?? 'test')
          .then((user)async {
        UserModel userModel = UserModel(
          userId: user.user!.uid,
          email: user.user!.email,
          name: nameUser,
          pic: '',
        );
        await FireStoreUser().addToFireStore(userModel);
      });
      Get.offAll(const HomeScreen());
      print('register in success');
    } catch (e) {
      print('we error');
      Get.snackbar('Error register account', e.toString(),
          colorText: Colors.black87,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red);
    }
  }
}
