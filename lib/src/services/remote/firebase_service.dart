import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/src/configs/app_setup.locator.dart';
import 'package:net_chef/src/models/category.dart';
import 'package:net_chef/src/models/order.dart';
import 'package:net_chef/src/models/product.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/auth_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:uuid/uuid.dart';

class FirebaseService {
  FirebaseService() {}

  AuthService authService = AuthService();

  //SignIn Section
  Future<bool> signInCustomerUser(String email, String password, BuildContext context) async {
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password);
      var isDone = await getCustomerUser(user.user!.uid);
      if (isDone.email == email) {
        return true;
      } else {
        await signOutCustomerUser();
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message:
            "User Not Exist in Customer Data",
          ),
        );
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        //TODO: print("Password Weak");
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message:
            e.toString(),
          ),
        );
      } else if (e.code == "email-already-in-use") {
        //TODO: print("Account Already Created");
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message:
            e.toString(),
          ),
        );
      }
      return false;
    } catch (e) {
      //TODO: print(e.toString());
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message:
          e.toString(),
        ),
      );
      return false;
    }
  }

  Future<bool> signInChefUser(String email, String password,BuildContext context) async {
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password);
      var isDone = await getChefUser(user.user!.uid);
      if (isDone.email == email) {
        return true;
      } else {
        await signOutCustomerUser();
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message:
            "User Not Exist in Chef Data",
          ),
        );
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        //TODO: print("Password Weak");
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message:
            e.toString(),
          ),
        );
      } else if (e.code == "email-already-in-use") {
        //TODO: print("Account Already Created");
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message:
            e.toString(),
          ),
        );
      }
      return false;
    } catch (e) {
      //TODO: print(e.toString());
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message:
          e.toString(),
        ),
      );
      return false;
    }
  }

  //SignIn Section

  //SignUp Section
  Future<bool> signUpCustomerUser(
      CustomerUser user, String password, File? imageFile) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email?.trim() ?? "", password: password);
      bool isDone = false;
      if (userCredential.user != null) {
        String? imageUrl = null;
        if (imageFile != null) {
          bool status = true;
          final metadata = SettableMetadata(
            contentType: 'image/jpeg',
            customMetadata: {'picked-file-path': imageFile.path},
          );
          var uploadTask = await FirebaseStorage.instance
              .ref()
              .child("costumerProfilePicture")
              .child("${userCredential.user?.uid.toString()}.jpg")
              .putFile(imageFile, metadata)
              .catchError((error) {
            status = false;
          });
          if (status == true) {
            imageUrl = await uploadTask.ref.getDownloadURL();
          }
        }
        CustomerUser newUser = CustomerUser(
          address: user.address,
          email: user.email,
          fullName: user.fullName,
          id: userCredential.user?.uid ?? "",
          identityNumber: user.identityNumber,
          orderCount: user.orderCount,
          totalOrderAmount: user.totalOrderAmount,
          phoneNumber: user.phoneNumber,
          profile: imageUrl ?? "",
        );
        isDone = await _createCustomerUser(newUser);
      }
      return isDone ? true : false;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        //TODO: print("Password Weak");
        locator<SnackbarService>().showSnackbar(message: e.code);
      } else if (e.code == "email-already-in-use") {
        //TODO: print("Account Already Created");
        locator<SnackbarService>().showSnackbar(message: e.code);
      }
      return false;
    } catch (e) {
      //TODO: print(e.toString());
      locator<SnackbarService>().showSnackbar(message: e.toString());
      return false;
    }
  }

  Future<bool> signUpChefUser(
      ChefUser user, String password, File? imageFile) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email?.trim() ?? "", password: password);
      bool isDone = false;
      if (userCredential.user != null) {
        String? imageUrl = null;
        if (imageFile != null) {
          bool status = true;
          final metadata = SettableMetadata(
            contentType: 'image/jpeg',
            customMetadata: {'picked-file-path': imageFile.path},
          );
          var uploadTask = await FirebaseStorage.instance
              .ref()
              .child("costumerProfilePicture")
              .child("${userCredential.user?.uid.toString()}.jpg")
              .putFile(imageFile, metadata)
              .catchError((error) {
            status = false;
          });
          if (status == true) {
            imageUrl = await uploadTask.ref.getDownloadURL();
          }
        }
        ChefUser newUser = ChefUser(
          id: userCredential.user?.uid ?? "",
          address: user.address,
          email: user.email,
          fullName: user.fullName,
          identityNumber: user.identityNumber,
          phoneNumber: user.phoneNumber,
          businessName: user.businessName,
          businessIcon: imageUrl,
          currentCategories: user.currentCategories,
          currentProducts: user.currentProducts,
          ordersCompletedAmount: user.ordersCompletedAmount,
          ordersCompletedCount: user.ordersCompletedCount,
          ordersPendingAmount: user.ordersPendingAmount,
          ordersPendingCount: user.ordersPendingCount,
        );

        isDone = await _createChefUser(newUser);
      }
      return isDone ? true : false;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        //TODO: print("Password Weak");
        locator<SnackbarService>().showSnackbar(message: e.code);
      } else if (e.code == "email-already-in-use") {
        //TODO: print("Account Already Created");
        locator<SnackbarService>().showSnackbar(message: e.code);
      }
      return false;
    } catch (e) {
      //TODO: print(e.toString());
      locator<SnackbarService>().showSnackbar(message: e.toString());
      return false;
    }
  }

  //SignUp Section

  //CreateUser Section
  Future<bool> _createCustomerUser(CustomerUser user) async {
    try {
      await FirebaseFirestore.instance
          .collection("CustomerUser")
          .doc(user.id)
          .set(user.toJson())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      return true;
    } on FirebaseAuthException catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.code);
      return false;
    } catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.toString());
      return false;
    }
  }

  Future<bool> _createChefUser(ChefUser user) async {
    try {
      await FirebaseFirestore.instance
          .collection("ChefUser")
          .doc(user.id)
          .set(user.toJson())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      return true;
    } on FirebaseAuthException catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.code);
      return false;
    } catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.toString());
      return false;
    }
  }

  //CreateUser Section

  //GetUser Section
  Future<CustomerUser> getCustomerUser(String id) async {
    CustomerUser user = CustomerUser();
    try {
      DocumentSnapshot docSnap = await FirebaseFirestore.instance
          .collection("CustomerUser")
          .doc(id)
          .get();

      if (docSnap.data() != null) {
        user = CustomerUser.fromJson(docSnap.data() as Map<String, dynamic>);
      }

      return user;
    } catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.toString());
      return user;
    }
  }

  Future<ChefUser> getChefUser(String id) async {
    ChefUser user = ChefUser();
    try {
      DocumentSnapshot docSnap =
          await FirebaseFirestore.instance.collection("ChefUser").doc(id).get();

      if (docSnap.data() != null) {
        user = ChefUser.fromJson(docSnap.data() as Map<String, dynamic>);
      }

      return user;
    } catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.toString());
      return user;
    }
  }

  //GetUser Section

  //GetUser Section
  Future<bool> signOutCustomerUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      authService.clear();
      return true;
    } on FirebaseAuthException catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.code);
      return false;
    } catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.toString());
      return false;
    }
  }

  Future<bool> signOutChefUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      authService.clear();
      return true;
    } on FirebaseAuthException catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.code);
      return false;
    } catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.toString());
      return false;
    }
  }

  //GetUser Section

  Future<bool> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.code);
      return false;
    } catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.toString());
      return false;
    }
  }

  Future<List<Order>> getOrdersByVender(String id) async {
    List<Order> order = [];
    try {
      List<Order> data = await FirebaseFirestore.instance
          .collection("Order")
          .where("venderId", isEqualTo: id)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((docSnap) {
          order.add(Order.fromJson(docSnap.data() as Map<String, dynamic>));
        });
        return order;
      });

      return order;
    } catch (e) {
      locator<SnackbarService>().showSnackbar(message: e.toString());
      return order;
    }
  }


  Future<bool> createProduct(ProductModel productModel, File? imageFile, BuildContext context, String userId, int currentProduct) async {
    try {
      String? imageUrl = null;
      if (imageFile != null) {
        bool status = true;
        final metadata = SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {'picked-file-path': imageFile.path},
        );
        var uploadTask = await FirebaseStorage.instance
            .ref()
            .child("productPicture")
            .child("${productModel.pName.toString()}-${productModel.id.toString()}.jpg")
            .putFile(imageFile, metadata)
            .catchError((error) {
          status = false;
        });
        if (status == true) {
          imageUrl = await uploadTask.ref.getDownloadURL();
        }
      }

      ProductModel newProductModel = ProductModel(
        id: productModel.id,
        pName: productModel.pName,
        pPrice: productModel.pPrice,
        pCat: productModel.pCat,
        pDes: productModel.pDes,
        pic: imageUrl,
      );
      await FirebaseFirestore.instance
          .collection("ChefUser")
          .doc(userId)
          .collection("Products")
          .doc(productModel.id)
          .set(newProductModel.toJson())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      await FirebaseFirestore.instance
          .collection("ChefUser")
          .doc(userId)
          .update({
        "currentProducts": currentProduct + 1
      });

      return true;
    } on FirebaseAuthException catch (e) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message:
          e.toString(),
        ),
      );
      return false;
    } catch (e) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message:
          e.toString(),
        ),
      );
      return false;
    }
  }

  Future<List<ProductModel>> getProducts(String userId, BuildContext context) async {
    List<ProductModel> productModel = [];
    try {
      List<ProductModel> data = await FirebaseFirestore.instance
          .collection("ChefUser")
          .doc(userId)
          .collection("Products")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((docSnap) {
          productModel.add(ProductModel.fromJson(docSnap.data() as Map<String, dynamic>));
        });
        return productModel;
      });

      return productModel;
    } catch (e) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message:
          e.toString(),
        ),
      );
      return productModel;
    }
  }

  Future<bool> createCategory(String name, BuildContext context, String userId,int currentCat) async {
    try {
      CategoryModel categoryModel = CategoryModel(
        id: "$userId-$name",
        pName: name
      );
      await FirebaseFirestore.instance
          .collection("ChefUser")
          .doc(userId)
          .collection("Category")
          .doc(categoryModel.id)
          .set(categoryModel.toJson())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));


      await FirebaseFirestore.instance
          .collection("ChefUser")
          .doc(userId)
          .update({
        "currentCategories": currentCat + 1
      });


      return true;
    } on FirebaseAuthException catch (e) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message:
          e.toString(),
        ),
      );
      return false;
    } catch (e) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message:
          e.toString(),
        ),
      );
      return false;
    }
  }

  Future<List<CategoryModel>> getCategoryForChef(String userId, BuildContext context) async {
    List<CategoryModel> categoryModel = [];
    try {
      List<CategoryModel> data = await FirebaseFirestore.instance
          .collection("ChefUser")
          .doc(userId)
          .collection("Category")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((docSnap) {
          categoryModel.add(CategoryModel.fromJson(docSnap.data() as Map<String, dynamic>));
        });
        return categoryModel;
      });

      return categoryModel;
    } catch (e) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message:
          e.toString(),
        ),
      );
      return categoryModel;
    }
  }
}
