import 'package:flutter/cupertino.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/base/auth_view_model.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends ReactiveViewModel with AuthViewModel {

  init(BuildContext context){
    CustomerUser? customerUser = authService.customerUser;
    ChefUser? chefUser = authService.chefUser;
    Future.delayed(const Duration(seconds: 3), () {
      if(customerUser?.id?.isNotEmpty ?? false){
        NavService.userDashboard();
      }
      else if(chefUser?.id?.isNotEmpty ?? false){
        NavService.chefDashboard();
      }
      else{
        return NavService.login();
      }
    });
  }
}
