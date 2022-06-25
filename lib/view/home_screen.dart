import 'package:ecommerce/constance.dart';
import 'package:ecommerce/view/auth/login_screen.dart';
import 'package:ecommerce/view/widget/custome_text.dart';
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
  List<String> names = [
    'men',
    's',
    's',
    's',
    's',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
      padding: const EdgeInsetsDirectional.only(top: 90, start: 20, end: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200),
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(height: 40),
          const CustomText(text: 'Categories', fontSize: 22),
          const SizedBox(height: 50),
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100),
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/men.png'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomText(text: names[index], fontSize: 14)
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 30,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ),
              itemCount: names.length,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CustomText(text: 'Best Selling ', fontSize: 18),
              CustomText(text: 'See All', fontSize: 18)
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 350,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100),
                        child: SizedBox(
                          height: 220,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Image.asset(
                            'assets/images/Image.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const CustomText(
                          text: 'Leather Wristwatch', fontSize: 18),
                      const SizedBox(height: 3),
                      const CustomText(
                        text: 'Tag Heuer',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 3),
                      const CustomText(
                          text: '\$350', fontSize: 18, color: primaryColor),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 30,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ),
              itemCount: names.length,
            ),
          ),
        ],
      ),
    ));
  }
}
