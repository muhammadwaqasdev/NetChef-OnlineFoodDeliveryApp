import 'package:flutter/material.dart';
import 'package:net_chef/src/models/cart_product_model.dart';
import 'package:net_chef/src/models/product.dart';
import 'package:net_chef/src/services/local/base/cart_service_view_model.dart';
import 'package:stacked/stacked.dart';

class ProductDetailViewModel extends ReactiveViewModel with CartServiceViewModel {

  ProductModel productModel;
  int productSelectedCount = 0;
  int selectedIndex = 0;
  List<String> selectedIngrediants = [];
  List<bool> isSelected = [];

  ProductDetailViewModel(this.productModel);
  init(BuildContext context,int totalProducts, int count) {
    productSelectedCount = count;
    for(int i = 0; i < totalProducts; i++){
      isSelected.add(false);
    }
  }
  onAddInCart(BuildContext context){
    int quantity = (double.parse(cartService.totalQuantity.toString()) + double.parse(productSelectedCount.toString())).toInt();
    int amount = (double.parse(cartService.totalAmount.toString()) + (double.parse(productModel.pPrice ?? "0") * double.parse(productSelectedCount.toString()))).toInt();
    CartProductModel cartProductModel = CartProductModel(
      productName: productModel.pName,
      productCatName: productModel.pCat,
      resturentName: "",
      resturentid: "",
      quantity: productSelectedCount.toString(),
      eachItemPrice: productModel.pPrice,
      totalItemPrice: (double.parse(productModel.pPrice ?? "0") * productSelectedCount.toDouble()).toStringAsFixed(0),
    );
    cartService.cartData(quantity,amount,cartProductModel);
    Navigator.pop(context);
  }
  
}
