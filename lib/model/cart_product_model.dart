class CartProductModel {
  String? name;
  String? image;
  String? price;
  int? quantity;


  CartProductModel({
    this.name,
    this.image,
    this.price,
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['quantity'] = quantity;
    return map;
  }
  CartProductModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
  }
}
