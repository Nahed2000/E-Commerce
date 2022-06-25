class CategoriesModel {
  String? name;
  String? image;

  CategoriesModel({
    required this.name,
    required this.image,
  });

  CategoriesModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    image = map['image'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
