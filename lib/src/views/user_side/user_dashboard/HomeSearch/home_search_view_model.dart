import 'package:flutter/material.dart';
import 'package:net_chef/src/models/product.dart';
import 'package:net_chef/src/services/local/base/auth_view_model.dart';
import 'package:net_chef/src/services/remote/base/firebase_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeSearchViewModel extends ReactiveViewModel
    with AuthViewModel, FirebaseViewModel {
  
  
  List<ProductModel> _productModel = [];

  List<ProductModel> get productModel => _productModel;

  set productModel(List<ProductModel> value) {
    _productModel = value;
  }


  List<int> productSelectedCount = [];


  init(String query, BuildContext context) async {
    setBusy(true);
    await productSearch(query, context);
    int listCount = productModel.length;
    for(int i = 0; i < listCount; i++){
      productSelectedCount.add(0);
    }
    setBusy(false);
  }

  Future<void> productSearch(String query, BuildContext context) async {
    List<ProductModel> isAdded = await firebaseService.getAllProducts(context);

    if(isAdded.isNotEmpty){
      productModel = isAdded.where((element) => element.pName!.contains(query)).toList();
      notifyListeners();
    }
  }

}
