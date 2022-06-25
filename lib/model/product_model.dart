import 'package:ecommerce/utilti/exn.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? name;
  String? image;
  String? description;
  Color? color;
  String? sized;
  String? price;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.color,
    required this.sized,
    required this.price,
  });

  ProductModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    map['color'] = color;
    map['sized'] = sized;
    map['price'] = price;
    return map;
  }
}
