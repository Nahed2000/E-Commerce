import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/categories_model.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';

class HomeViewModel extends GetxController {
  final CollectionReference collectionReferenceCategories =
      FirebaseFirestore.instance.collection('Categories');

  final CollectionReference collectionReferenceProduct =
      FirebaseFirestore.instance.collection('Product');
  bool loadingValue = true;

  final List<CategoriesModel> categoriesList = <CategoriesModel>[];
  final List<ProductModel> productList = <ProductModel>[];

  HomeViewModel() {
    getCategoriesData();
    getProductData();
  }

  getCategoriesData() async {
    loadingValue = true;
    await collectionReferenceCategories.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        categoriesList.add(CategoriesModel.fromJson(
            value.docs[i].data() as Map<String, dynamic>));
      }
      loadingValue = false;
      update();
    });
  }

  getProductData() async {
    loadingValue = true;
    await collectionReferenceProduct.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        productList.add(ProductModel.fromJson(
            value.docs[i].data() as Map<String, dynamic>));
        print(value);
      }
      loadingValue = false;
      update();
    });
  }
}
