import 'package:ecommerce/view/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),

      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Log Out'),
          onPressed: () {
            _auth.signOut();
            Get.offAll(LoginView());
          },
        ),
      ),
    );
  }
}
