import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:net_chef/src/models/order.dart';
import 'package:net_chef/src/models/product.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/base/auth_view_model.dart';
import 'package:net_chef/src/services/remote/base/firebase_view_model.dart';
import 'package:net_chef/src/shared/drawer_container.dart';
import 'package:stacked/stacked.dart';

class ChefProductsViewModel extends ReactiveViewModel with AuthViewModel, FirebaseViewModel{

  ChefUser? currentUser = ChefUser();
  DrawerContainerController drawerContainerController =
  DrawerContainerController();



  List<ProductModel> _productData = [];

  List<ProductModel> get productData => _productData;

  set productData(List<ProductModel> value) {
    _productData = value;
  }

  getSync(BuildContext context) async{
    setBusy(true);
    String _id = FirebaseAuth.instance.currentUser?.uid ?? "";
    ChefUser user = await firebaseService.getChefUser(_id);
    if(user.id != ""){
      authService.clear();
      authService.chefUser = user;
      init(context);
    }
    setBusy(false);
  }

  Future<void> getProducts(BuildContext context,String userId)async {

    List<ProductModel> isAdded = await firebaseService.getProducts(userId, context);

    if(isAdded.isNotEmpty){
      productData = isAdded;
      notifyListeners();
    }
  }
  init(BuildContext context){
    currentUser = authService.chefUser;
    if(currentUser!.id!.isNotEmpty){
      getProducts(context, currentUser!.id!);
    }
  }

}
