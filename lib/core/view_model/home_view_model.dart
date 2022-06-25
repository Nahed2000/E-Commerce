import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/categories_model.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';

class HomeViewModel extends GetxController {
  final CollectionReference collectionReferenceCategories =
      FirebaseFirestore.instance.collection('Categories');

  final CollectionReference collectionReferenceProduct =
      FirebaseFirestore.instance.collection('Product');
  bool _loadingValue = true;

  bool get loadingValue => _loadingValue;
  final List<CategoriesModel> _categoriesList = <CategoriesModel>[];
  final List<ProductModel> _productList = <ProductModel>[];

  List<CategoriesModel> get categoriesList => _categoriesList;

  List<ProductModel> get productList => _productList;

  HomeViewModel() {
    getCategoriesData();
    getProductData();
  }

  getCategoriesData() async {
    _loadingValue = true;
    await collectionReferenceCategories.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        _categoriesList.add(CategoriesModel.fromJson(
            value.docs[i].data() as Map<String, dynamic>));
      }
      _loadingValue = false;
      update();
    });
  }

  getProductData() async {
    _loadingValue = true;
    await collectionReferenceProduct.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        _productList.add(ProductModel.fromJson(
            value.docs[i].data() as Map<String, dynamic>));
        print(value);
      }
      _loadingValue = false;

      update();
    });
  }
}
