import 'package:ecommerce/constance.dart';
import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/view/widget/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/custom_bottun.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  // List<String> name = <String>[
  //   'nahed',
  //   'nahed',
  //   'nahed',
  //   'nahed',
  //   'nahed',
  // ];
  // List<String> image = <String>[
  //   'assets/images/Image.png',
  //   'assets/images/Image.png',
  //   'assets/images/Image.png',
  //   'assets/images/Image.png',
  //   'assets/images/Image.png',
  // ];
  // List<int> price = <int>[
  //   123,
  //   123,
  //   123,
  //   123,
  //   123,
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GetBuilder<CartViewModel>(
            init: CartViewModel(),
            builder: (controller) => Container(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      // alignment: Alignment.center,
                      height: 190,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                                controller.cartProductModel[index].image ?? '',
                                fit: BoxFit.fill),
                            const SizedBox(width: 20),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: controller
                                              .cartProductModel[index].name ??
                                          '',
                                      fontSize: 24),
                                  const SizedBox(height: 10),
                                  CustomText(
                                    text:
                                        '\$${controller.cartProductModel[index].price ?? ''}',
                                    fontSize: 18,
                                    color: primaryColor,
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    width: 140,
                                    color: Colors.grey.shade200,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.add),
                                        const SizedBox(width: 10),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: CustomText(
                                            text:
                                                '${controller.cartProductModel[index].quantity}',
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 18.0),
                                          child: Icon(Icons.minimize),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: controller.cartProductModel.length),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomText(text: 'Total', fontSize: 14),
                  SizedBox(height: 5),
                  CustomText(
                    text: '\$500',
                    fontSize: 22,
                    color: primaryColor,
                  )
                ],
              ),
              CustomButton(
                text: 'CHECKOUT',
                height: 50,
                onPressed: () {},
                weight: 150,
              )
            ],
          ),
        )
      ],
    );
  }
}
