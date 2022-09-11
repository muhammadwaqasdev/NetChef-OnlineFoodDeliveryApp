import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/models/cart_product_model.dart';
import 'package:net_chef/src/models/make_own_ingrediant.dart';
import 'package:net_chef/src/models/product.dart';
import 'package:net_chef/src/services/local/base/cart_service_view_model.dart';
import 'package:stacked/stacked.dart';

class MakeOwnViewModel extends ReactiveViewModel with CartServiceViewModel {

  List<MakeOwnIngrediant> selectedIngrediants = [];

  List<Widget> elements = [];

  final focuced = ValueNotifier(false);
  init() {

  }

  int price = 700;

  final ingrediants = <MakeOwnIngrediant>[
    MakeOwnIngrediant(Images.chili,"Chili", <Offset>[Offset(0.2, 0.2),Offset(0.6, 0.2),Offset(0.4, 0.25),Offset(0.5, 0.3),Offset(0.4, 0.65)]),
    MakeOwnIngrediant(Images.garlic, "Garlic", <Offset>[Offset(0.2, 0.35),Offset(0.65, 0.35),Offset(0.3, 0.23),Offset(0.5, 0.2),Offset(0.3, 0.5)]),
    MakeOwnIngrediant(Images.olive,"Olive", <Offset>[Offset(0.25, 0.5),Offset(0.65, 0.6),Offset(0.2, 0.3),Offset(0.4, 0.3),Offset(0.2, 0.6)]),
    MakeOwnIngrediant(Images.onion,"Onion", <Offset>[Offset(0.2, 0.26),Offset(0.65, 0.3),Offset(0.25, 0.25),Offset(0.45, 0.35),Offset(0.4, 0.65)]),
    MakeOwnIngrediant(Images.pea,"Pea", <Offset>[Offset(0.2, 0.35),Offset(0.65, 0.35),Offset(0.3, 0.23),Offset(0.3, 0.2),Offset(0.3, 0.5)]),
    MakeOwnIngrediant(Images.pickle, "Pickle", <Offset>[Offset(0.2, 0.65),Offset(0.65, 0.3),Offset(0.25, 0.25),Offset(0.45, 0.35),Offset(0.4, 0.65)]),
    MakeOwnIngrediant(Images.potato, "Potato", <Offset>[Offset(0.2, 0.2),Offset(0.6, 0.2),Offset(0.4, 0.25),Offset(0.5, 0.3),Offset(0.4, 0.65)]),
  ];

  onAddInCart(BuildContext context){
    int quantity = (double.parse(cartService.totalQuantity.toString()) + double.parse("1")).toInt();
    int amount = (double.parse(cartService.totalAmount.toString()) + (price.toDouble() * double.parse("1"))).toInt();
    CartProductModel cartProductModel = CartProductModel(
      productName: "Custom Pizza",
      productCatName: "Fast Food",
      resturentName: "",
      resturentid: "",
      quantity: "1",
      eachItemPrice: price.toString(),
      totalItemPrice: price.toString(),
    );
    cartService.cartData(quantity,amount,cartProductModel);
    Navigator.pop(context);
  }


}
