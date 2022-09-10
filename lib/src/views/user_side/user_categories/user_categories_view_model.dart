import 'package:flutter/cupertino.dart';
import 'package:net_chef/src/models/product.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/base/auth_view_model.dart';
import 'package:net_chef/src/services/local/base/cart_service_view_model.dart';
import 'package:net_chef/src/services/remote/base/firebase_view_model.dart';
import 'package:net_chef/src/shared/drawer_container.dart';
import 'package:stacked/stacked.dart';

class UserCategoriesViewModel extends ReactiveViewModel with AuthViewModel, FirebaseViewModel, CartServiceViewModel {
  final String categoryId;

  UserCategoriesViewModel({required this.categoryId});

  CustomerUser? currentUser = CustomerUser();
  DrawerContainerController drawerContainerController =
  DrawerContainerController();

  List<ProductModel> _productModel = [];

  List<ProductModel> get productModel => _productModel;

  set productModel(List<ProductModel> value) {
    _productModel = value;
  }
  List<int> productSelectedCount = [];

  init(BuildContext context, int totalProducts) async {
    setBusy(true);
    for(int i = 0; i < totalProducts; i++){
      productSelectedCount.add(0);
    }
    currentUser = authService.customerUser;
    await getProductsByCategory(context);
    setBusy(false);
  }

  getProductsByCategory(BuildContext context) async {
    List<ProductModel> isAdded = await firebaseService.getProductsByCategory(categoryId, context);

    if(isAdded.isNotEmpty){
      productModel = isAdded;
      notifyListeners();
    }
  }
}
