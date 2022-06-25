import 'package:ecommerce/constance.dart';
import 'package:ecommerce/core/view_model/controller_view_model.dart';
import 'package:ecommerce/core/view_model/home_view_model.dart';

import 'package:ecommerce/view/widget/custome_text.dart';
import 'package:ecommerce/view/widget/details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // List<String> names = [
  //   'men',
  //   's',
  //   's',
  //   's',
  //   's',
  // ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loadingValue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                padding: const EdgeInsetsDirectional.only(
                    top: 90, start: 20, end: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      searchTextField(),
                      const SizedBox(height: 40),
                      const CustomText(text: 'Categories', fontSize: 22),
                      const SizedBox(height: 30),
                      categoriesList(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(text: 'Best Selling ', fontSize: 18),
                          CustomText(text: 'See All', fontSize: 18)
                        ],
                      ),
                      const SizedBox(height: 30),
                      bestSellingList(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget bestSellingList() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => SizedBox(
        height: 350,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(
                DetailsScreen(productModel: controller.productList[index]),
              ),
              child: SizedBox(
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
                        child: Image.network(
                          controller.productList[index].image ?? '',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomText(
                        text: controller.productList[index].name ?? '',
                        fontSize: 18),
                    const SizedBox(height: 3),
                    CustomText(
                      text: controller.productList[index].description ?? '',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 3),
                    CustomText(
                      text: '${controller.productList[index].price} \$',
                      fontSize: 18,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 30,
            child: Padding(
              padding: EdgeInsets.all(8.0),
            ),
          ),
          itemCount: controller.productList.length,
        ),
      ),
    );
  }
  Widget categoriesList() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => SizedBox(
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
                    child: Image.network(
                        controller.categoriesList[index].image ?? ''),
                  ),
                ),
                const SizedBox(height: 20),
                CustomText(
                  text: controller.categoriesList[index].name ?? '',
                  fontSize: 14,
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 30,
            child: Padding(
              padding: EdgeInsets.all(8.0),
            ),
          ),
          itemCount: controller.categoriesList.length,
        ),
      ),
    );
  }

  Widget searchTextField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
