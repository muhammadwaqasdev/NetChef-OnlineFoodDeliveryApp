import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:net_chef/src/models/order.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/base/auth_view_model.dart';
import 'package:net_chef/src/services/remote/base/firebase_view_model.dart';
import 'package:net_chef/src/shared/drawer_container.dart';
import 'package:stacked/stacked.dart';

class ChefOrdersViewModel extends ReactiveViewModel with AuthViewModel, FirebaseViewModel{

  ChefUser? currentUser = ChefUser();
  DrawerContainerController drawerContainerController =
  DrawerContainerController();

  List<Order> _ordersData = [];

  List<Order> get ordersData => _ordersData;

  set ordersData(List<Order> value) {
    _ordersData = value;
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
  init(BuildContext context){
    currentUser = authService.chefUser;
    if(currentUser!.id!.isNotEmpty){
      getPendingOrders(currentUser!.id!);
    }
  }

  getPendingOrders(String id) async{
    ordersData = await firebaseService.getOrdersByVender(id);
    notifyListeners();
  }
}
