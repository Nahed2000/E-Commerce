class UserModel {
  late String userId;

  String? email;

  String? name;

  String? pic;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
  });

  UserModel.fromJson(Map<String, dynamic> map) {

    userId = map['userId'];
    email = map['email'];
    name = map['password'];
    pic = map['pic'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['userId'] = userId;
    map['email'] = email;
    map['password'] = name;
    map['pic'] = pic;
    return map;
  }
}
