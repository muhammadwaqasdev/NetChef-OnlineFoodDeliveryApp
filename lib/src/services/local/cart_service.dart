import 'dart:convert';

import 'package:net_chef/src/models/cart_product_model.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class CartService with ReactiveServiceMixin {
  ReactiveList<CartProductModel> _cartProducts = ReactiveList<CartProductModel>();
  ReactiveValue<int?> _totalQuantity = ReactiveValue<int?>(0);
  ReactiveValue<int?> _totalAmount = ReactiveValue<int?>(0);


  List<CartProductModel> get cartProducts => _cartProducts;
  int? get totalQuantity => _totalQuantity.value;
  int? get totalAmount => _totalAmount.value;


  final String _prefKeyCart = "CART_DATA";


  CartService() {
    listenToReactiveValues([_cartProducts]);
    listenToReactiveValues([_totalQuantity]);
    listenToReactiveValues([_totalAmount]);
    //_restoreCartFromLocal();
  }

  clear(){
    cartProducts.clear();
    totalQuantity = 0;
    totalAmount = 0;
    //_clearCartFromLocal();
  }

  set cartProducts(List<CartProductModel> cartProductModel) {
    _cartProducts.addAll(cartProductModel);
    //_storeLocally();
  }
  set totalQuantity(int? qty) {
    _totalQuantity.value = qty;
    //_storeLocally();
  }
  set totalAmount(int? amount) {
    _totalAmount.value = amount;
    //_storeLocally();
  }

  void cartData(int qty,int amount, CartProductModel cartProductModel) {
    totalQuantity = qty;
    totalAmount = amount;
    cartProducts.add(cartProductModel);
    //_storeLocally();
  }

  // _storeLocally() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("${_prefKeyCart}_PRODUCTS", jsonEncode(_cartProducts));
  //   prefs.setInt("${_prefKeyCart}_QUANTITY", _totalQuantity.value ?? 0);
  //   prefs.setInt("${_prefKeyCart}_AMOUNT", _totalAmount.value ?? 0);
  // }

  // _restoreCartFromLocal() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.containsKey("${_prefKeyCart}_PRODUCTS")){
  //     cartProducts =
  //         CartProductModel.fromJson(jsonDecode(prefs.getString("${_prefKeyCart}_PRODUCTS") ?? "{}"));
  //   }
  //   if (prefs.containsKey("${_prefKeyCart}_QUANTITY")){
  //     totalQuantity = prefs.getInt("${_prefKeyCart}_QUANTITY") ?? 0;
  //   }
  //   if (prefs.containsKey("${_prefKeyCart}_AMOUNT")){
  //     totalAmount = prefs.getInt("${_prefKeyCart}_AMOUNT") ?? 0;
  //   }
  // }

  // _clearCartFromLocal() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.containsKey("${_prefKeyCart}_PRODUCTS")){
  //     prefs.remove("${_prefKeyCart}_PRODUCTS");
  //   }else if (prefs.containsKey("${_prefKeyCart}_QUANTITY")){
  //     prefs.remove("${_prefKeyCart}_QUANTITY");
  //   }else if (prefs.containsKey("${_prefKeyCart}_AMOUNT")){
  //     prefs.remove("${_prefKeyCart}_AMOUNT");
  //   }
  // }
}
