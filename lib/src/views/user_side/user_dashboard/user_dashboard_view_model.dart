import 'package:flutter/cupertino.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/base/auth_view_model.dart';
import 'package:net_chef/src/shared/drawer_container.dart';
import 'package:stacked/stacked.dart';

class UserDashboardViewModel extends ReactiveViewModel with AuthViewModel {

  CustomerUser? currentUser = CustomerUser();
  DrawerContainerController drawerContainerController =
  DrawerContainerController();

  init(BuildContext context){
    currentUser = authService.customerUser;
  }
}
