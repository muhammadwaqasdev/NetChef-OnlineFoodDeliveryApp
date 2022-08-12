import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:net_chef/src/services/local/base/auth_view_model.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/services/remote/base/firebase_view_model.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordViewModel extends ReactiveViewModel with FirebaseViewModel, AuthViewModel {
  bool isCustomerSelected = true;

  TextEditingController email = TextEditingController();

  init(BuildContext context) {

  }

  void checkValidate(BuildContext context) {
    if (m.Form.of(context)?.validate() ?? false) {
      setBusy(true);
      resetPassword(context);
    }
  }

  Future<void> resetPassword(BuildContext context) async {
    bool isDone = await firebaseService.resetPassword(email.text);
    if(isDone){
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Email sent"),
          content: const Text("Check your email and reset pasword"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: const Text("okay"),
              ),
            ),
          ],
        ),
      );
    }else{
      setBusy(false);
    }
  }
}
