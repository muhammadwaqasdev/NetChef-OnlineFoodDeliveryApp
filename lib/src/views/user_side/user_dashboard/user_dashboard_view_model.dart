import 'package:flutter/cupertino.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/drawer_container.dart';
import 'package:stacked/stacked.dart';

class UserDashboardViewModel extends BaseViewModel {


  DrawerContainerController drawerContainerController =
  DrawerContainerController();

  init(BuildContext context){
    // Future.delayed(Duration(seconds: 2));
    // NavService.home();
  }
}
