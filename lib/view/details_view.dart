import 'package:ecommerce/constance.dart';
import 'package:ecommerce/database/controller/db_controller.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/view/widget/custom_bottun.dart';
import 'package:ecommerce/view/widget/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/view_model/cart_view_model.dart';
import '../model/cart_product_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    required this.productModel,
    Key? key,
  }) : super(key: key);
  final ProductModel productModel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.network(
                  widget.productModel.image ?? '',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  CustomText(
                    text: widget.productModel.name ?? '',
                    fontSize: 26,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(text: 'Size', fontSize: 14),
                            CustomText(
                                text: widget.productModel.sized ?? '',
                                fontSize: 14),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(text: 'Color', fontSize: 14),
                            Container(
                              width: 30,
                              height: 20,
                              decoration: BoxDecoration(
                                color: widget.productModel.color,
                                border: Border.all(color: Colors.grey.shade100),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const CustomText(text: 'Details', fontSize: 18),
                  const SizedBox(height: 20),
                  CustomText(
                    text: widget.productModel.description ?? '',
                    fontSize: 14,
                    maxLine: 15,
                    height: 2,
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CustomText(text: 'PRICE', fontSize: 16),
                          const SizedBox(height: 5),
                          CustomText(
                            text: '\$${widget.productModel.price}',
                            fontSize: 22,
                            color: primaryColor,
                          )
                        ],
                      ),
                      GetBuilder<CartViewModel>(
                        init: CartViewModel(),
                        builder: (controller) => Container(
                          padding: const EdgeInsets.all(20),
                          height: 100,
                          width: 180,
                          child: CustomButton(
                            text: 'Add',
                            height: 50,
                            onPressed: () async {
                              print('weeeeeeee');
                              await controller.addProduct(
                                model: CartProductModel(
                                  image: widget.productModel.image,
                                  name: widget.productModel.name,
                                  price: widget.productModel.price,
                                  quantity: 1,
                                ),
                              );
                              print('add task ${controller.cartProductModel.length}');
                              print(
                                  'product image is${widget.productModel.image}');
                              print(
                                  'product name is${widget.productModel.name}');
                              print(
                                  'product price is${widget.productModel.price}');
                              print(' quantity is : 1');
                              print('we021');
                            },
                            weight: 150,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
