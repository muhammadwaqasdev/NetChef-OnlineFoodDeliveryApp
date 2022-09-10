import 'package:flutter/material.dart';
import 'package:net_chef/src/models/product.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/base/auth_view_model.dart';
import 'package:net_chef/src/services/local/base/cart_service_view_model.dart';
import 'package:net_chef/src/services/remote/base/firebase_view_model.dart';
import 'package:stacked/stacked.dart';

class RestaurantsProductsViewModel extends ReactiveViewModel with AuthViewModel, FirebaseViewModel, CartServiceViewModel  {
  final ChefUser chefId;

  RestaurantsProductsViewModel({required this.chefId});


  int selectedIndex = 0;
  List<int> productSelectedCount = [];
  CustomerUser? currentUser = CustomerUser();

  List<ProductModel> _productModel = [];

  List<ProductModel> get productModel => _productModel;

  set productModel(List<ProductModel> value) {
    _productModel = value;
  }

  init(BuildContext context,int totalProducts) async {
    setBusy(true);
    currentUser = authService.customerUser;
    await getProductsByCategory(context);
    int listCount = productModel.length;
    for(int i = 0; i < listCount; i++){
      productSelectedCount.add(0);
    }
    setBusy(false);
  }

  getProductsByCategory(BuildContext context) async {
    List<ProductModel> isAdded = await firebaseService.getProductsByChef(chefId.id ?? "", context);

    if(isAdded.isNotEmpty){
      productModel = isAdded;
      notifyListeners();
    }
  }
}
