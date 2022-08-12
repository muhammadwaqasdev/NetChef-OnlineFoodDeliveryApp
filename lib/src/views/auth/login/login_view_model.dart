import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:net_chef/src/services/local/base/auth_view_model.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/services/remote/base/firebase_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends ReactiveViewModel with FirebaseViewModel, AuthViewModel {
  bool isCustomerSelected = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  init(BuildContext context) {

  }

  void checkValidate(BuildContext context) {
    if (m.Form.of(context)?.validate() ?? false) {
      setBusy(true);
      isCustomerSelected ? signInCustomer() : signInChef();
    }
  }

  Future<void> signInCustomer() async {
    bool isDone = await firebaseService.signInCustomerUser(email.text, password.text);
    if(isDone){
      authService.customerUser = await firebaseService.getCustomerUser(FirebaseAuth.instance.currentUser?.uid ?? "");
      NavService.userDashboard();
      setBusy(false);
    }else{
      setBusy(false);
    }
  }
  Future<void> signInChef() async {
    bool isDone = await firebaseService.signInChefUser(email.text, password.text);
    if(isDone){
      authService.chefUser = await firebaseService.getChefUser(FirebaseAuth.instance.currentUser?.uid ?? "");
      NavService.chefDashboard();
      setBusy(false);
    }else{
      setBusy(false);

    }
  }
}
