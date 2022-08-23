import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/auth_service.dart';
import 'package:net_chef/src/services/local/base/auth_view_model.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/services/remote/base/firebase_view_model.dart';
import 'package:stacked/stacked.dart';

class SignupViewModel extends ReactiveViewModel with FirebaseViewModel, AuthViewModel {

  bool isCustomerSelected = true;

  File? selectedImage;

  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController identityNumber = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController deliveryAddress = TextEditingController();

  //Chef or Restaurants
  TextEditingController businessName = TextEditingController();
  String profilePicture = "";

  init(BuildContext context) {

  }

  void checkValidate(BuildContext context) {
    if (m.Form.of(context)?.validate() ?? false) {
      setBusy(true);
      isCustomerSelected ? signUpCustomer() : signUpChef();
    }
  }

  Future<void> signUpCustomer() async {
    CustomerUser user = CustomerUser(
      address: address.text,
      email: email.text,
      fullName: fullName.text,
      identityNumber: identityNumber.text,
      orderCount: 0,
      totalOrderAmount: 0,
      phoneNumber: phoneNumber.text,
      profile: profilePicture,
    );
    bool isDone = await firebaseService.signUpCustomerUser(user, password.text,selectedImage);
    if(isDone == true){
      authService.customerUser = await firebaseService.getCustomerUser(FirebaseAuth.instance.currentUser?.uid ?? "");
      NavService.userDashboard();
      setBusy(false);
    }else {
      setBusy(false);
    }
  }
  Future<void> signUpChef() async {
    ChefUser user = ChefUser(
      address: address.text,
      email: email.text,
      fullName: fullName.text,
      identityNumber: identityNumber.text,
      phoneNumber: phoneNumber.text,
      businessName: businessName.text,
      businessIcon: profilePicture,
      currentCategories: 0,
      currentProducts: 0,
      ordersCompletedAmount: 0,
      ordersCompletedCount: 0,
      ordersPendingAmount: 0,
      ordersPendingCount: 0,
    );
    bool isDone = await firebaseService.signUpChefUser(user, password.text,selectedImage);
    if(isDone == true){
      authService.chefUser = await firebaseService.getChefUser(FirebaseAuth.instance.currentUser?.uid ?? "");
      NavService.chefDashboard();
      setBusy(false);
    }else {
      setBusy(false);
    }
  }

  Future<void> uploadImage(File value) async {
    selectedImage = value;
    notifyListeners();
  }
}
