import 'package:flutter/cupertino.dart';
import 'package:net_chef/src/models/category.dart';
import 'package:net_chef/src/models/product.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/base/auth_view_model.dart';
import 'package:net_chef/src/services/remote/base/firebase_view_model.dart';
import 'package:net_chef/src/shared/drawer_container.dart';
import 'package:stacked/stacked.dart';

class UserDashboardViewModel extends ReactiveViewModel with AuthViewModel, FirebaseViewModel {

  CustomerUser? currentUser = CustomerUser();
  DrawerContainerController drawerContainerController =
  DrawerContainerController();

  List<CategoryModel> _categoryModel = [];

  List<CategoryModel> get categoryModel => _categoryModel;

  set categoryModel(List<CategoryModel> value) {
    _categoryModel = value;
  }


  List<ChefUser> _topChefModel = [];

  List<ChefUser> get topChefModel => _topChefModel;

  set topChefModel(List<ChefUser> value) {
    _topChefModel = value;
  }

  init(BuildContext context) async {
    setBusy(true);
    currentUser = authService.customerUser;
    await getCategory(context);
    await getTopRestaurant(context);
    setBusy(false);
  }

  getCategory(BuildContext context) async {
    List<CategoryModel> isAdded = await firebaseService.getCategoryForUser(context);

    if(isAdded.isNotEmpty){
      categoryModel = isAdded;
      notifyListeners();
    }
  }
  getTopRestaurant(BuildContext context) async {
    List<ChefUser> isAdded = await firebaseService.getTopRestaurant(context);

    if(isAdded.isNotEmpty){
      topChefModel = isAdded;
      notifyListeners();
    }
  }
}
