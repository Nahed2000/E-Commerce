import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/user_model.dart';

class FireStoreUser {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('User');

  Future<void> addUserToFireStore({required UserModel userModel}) async {
    return await collectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}
