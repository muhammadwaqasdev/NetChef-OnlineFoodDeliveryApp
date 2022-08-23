import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:net_chef/src/models/category.dart';
import 'package:net_chef/src/models/product.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/base/auth_view_model.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/services/remote/base/firebase_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:uuid/uuid.dart';

class ChefAddProductsViewModel extends ReactiveViewModel with AuthViewModel, FirebaseViewModel{

  File? selectedImage;
  ChefUser currentUser = ChefUser();

  var uuid = Uuid();
  TextEditingController categoryName = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productCat = TextEditingController();
  TextEditingController productDes = TextEditingController();

  
  String productPicture = "";

  List<CategoryModel> _categoryModel = [];

  List<CategoryModel> get categoryModel => _categoryModel;

  set categoryModel(List<CategoryModel> value) {
    _categoryModel = value;
  }

  init(BuildContext context) {
    currentUser = authService.chefUser ?? ChefUser();
  }

  clear(){
    productName.clear();
    productPrice.clear();
    productCat.clear();
    productDes.clear();
    productPicture = "";
    selectedImage?.delete();
  }


  Future<void> checkValidate(BuildContext context, BuildContext cont) async {
    if (m.Form.of(context)?.validate() ?? false) {
      setBusy(true);
      await setProduct(context, cont);
      setBusy(false);
    }
  }

  Future<void> setProduct(BuildContext context, BuildContext cont)async {
    ProductModel newProductModel = ProductModel(
      id: uuid.v4(),
      pName: productName.text,
      pPrice: productPrice.text,
      pCat: productCat.text,
      pDes: productDes.text,
      pic: "",
    );
    bool isAdded = await firebaseService.createProduct(newProductModel, selectedImage, context, currentUser.id ?? "", currentUser.currentProducts ?? 0);

    if(isAdded){
      clear();
      showTopSnackBar(
        cont,
        CustomSnackBar.success(
          message:
          "Good job, New Product Added Successfully",
        ),
      );
    }
  }


  Future<void> addCategory(BuildContext context,String userId, String name)async {

    bool isAdded = await firebaseService.createCategory(name, context, userId, currentUser.currentCategories ?? 0);

    if(isAdded){
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message:
          "Good job, New Category Added Successfully",
        ),
      );
    }
  }

  Future<void> getCategory(BuildContext context,String userId)async {

    List<CategoryModel> isAdded = await firebaseService.getCategoryForChef(userId, context);

    if(isAdded.isNotEmpty){
      categoryModel = isAdded;
      notifyListeners();
    }
  }


  Future<void> uploadImage(File value) async {
    selectedImage = value;
    notifyListeners();
  }
}
