import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   final FacebookLogin _facebookLogin = FacebookLogin();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
    GoogleSignInAuthentication googleSignInAuthentication = await userAccount!
        .authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,);
await _firebaseAuth.signInWithCredential(credential);
  }
  Future<void>facebookSignInMethode()async{
   FacebookLoginResult result = await _facebookLogin.logIn(permissions: [FacebookPermission.email]);
   final accessToken = result.accessToken!.token;
    if(result.status == FacebookLoginStatus.success){
      final AuthCredential credential = FacebookAuthProvider.credential(accessToken);
      await _firebaseAuth.signInWithCredential(credential);
    }
  }
}