import 'dart:convert';

import 'package:net_chef/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class AuthService with ReactiveServiceMixin {
  ReactiveValue<CustomerUser?> _customerUser = ReactiveValue<CustomerUser?>(null);
  ReactiveValue<ChefUser?> _chefUser = ReactiveValue<ChefUser?>(null);


  CustomerUser? get customerUser => _customerUser.value;
  ChefUser? get chefUser => _chefUser.value;


  final String _prefKeyCostumer = "COSTUMER_LOGIN_DATA";
  final String _prefKeyChef = "CHEF_LOGIN_DATA";


  AuthService() {
    listenToReactiveValues([_customerUser]);
    listenToReactiveValues([_chefUser]);
    _restoreUserFromLocal();
  }

  clear(){
    customerUser = null;
    chefUser = null;
    _clearUserFromLocal();
  }

  set customerUser(CustomerUser? customerUser) {
    _customerUser.value = customerUser;
    _storeLocallyCostumer();
  }

  set chefUser(ChefUser? chefUser) {
    _chefUser.value = chefUser;
    _storeLocallyChef();
  }


  _storeLocallyCostumer() async {
    if (_customerUser.value != null) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_prefKeyCostumer, jsonEncode(_customerUser.value?.toJson() ?? {}));
  }
  _storeLocallyChef() async {
    if (_chefUser.value != null) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_prefKeyChef, jsonEncode(_chefUser.value?.toJson() ?? {}));
  }

  _restoreUserFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_prefKeyCostumer)){
      customerUser =
          CustomerUser.fromJson(jsonDecode(prefs.getString(_prefKeyCostumer) ?? "{}"));
    }else if (prefs.containsKey(_prefKeyChef)){
      chefUser =
          ChefUser.fromJson(jsonDecode(prefs.getString(_prefKeyChef) ?? "{}"));
    }
  }

  _clearUserFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_prefKeyCostumer)){
      prefs.remove(_prefKeyCostumer);
    }else if (prefs.containsKey(_prefKeyChef)){
      prefs.remove(_prefKeyChef);
    }
  }
}
