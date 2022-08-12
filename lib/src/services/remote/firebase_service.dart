import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:net_chef/src/configs/app_setup.locator.dart';
import 'package:net_chef/src/models/order.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/auth_service.dart';
import 'package:stacked_services/stacked_services.dart';

class FirebaseService {
  FirebaseService() {}

  AuthService authService = AuthService();

  //SignIn Section
  Future<bool> signInCustomerUser(String email, String password) async {
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password);
      var isDone = await getCustomerUser(user.user!.uid);
      if (isDone.email == email) {
        return true;
      } else {
        await signOutCustomerUser();
        locator<SnackbarService>().showSnackbar(message: "User not exist");
        return false;
      }
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

  Future<bool> signInChefUser(String email, String password) async {
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password);
      var isDone = await getChefUser(user.user!.uid);
      if (isDone.email == email) {
        return true;
      } else {
        await signOutCustomerUser();
        locator<SnackbarService>().showSnackbar(message: "User not exist");
        return false;
      }
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
          gender: user.gender,
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
          gender: user.gender,
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
}
