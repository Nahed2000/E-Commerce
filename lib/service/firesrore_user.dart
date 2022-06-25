import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/user_model.dart';

class FireStoreUser {
  final CollectionReference userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addToFireStore(UserModel userModel) async {
    return await  userCollectionRef.doc(userModel.userId).set(userModel.toJson());
  }

}
