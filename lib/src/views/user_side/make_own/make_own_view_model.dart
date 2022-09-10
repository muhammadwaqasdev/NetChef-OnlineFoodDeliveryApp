import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/models/cart_product_model.dart';
import 'package:net_chef/src/models/make_own_ingrediant.dart';
import 'package:net_chef/src/models/product.dart';
import 'package:net_chef/src/services/local/base/cart_service_view_model.dart';
import 'package:stacked/stacked.dart';

class MakeOwnViewModel extends ReactiveViewModel with CartServiceViewModel {

  final selectedIngrediants = <MakeOwnIngrediant>[];

  List<Widget> elements = [];

  final focuced = ValueNotifier(false);
  init() {

  }
  onAddInCart(){

  }

  final ingrediants = <MakeOwnIngrediant>[
    MakeOwnIngrediant(Images.chili,"Chili", <Offset>[Offset(0.2, 0.2),Offset(0.5, 0.2),Offset(0.3, 0.2)]),
    MakeOwnIngrediant(Images.garlic, "Garlic", <Offset>[Offset(0.46, 0.3),Offset(0.84, 0.3),Offset(0.31, 0.3)]),
    MakeOwnIngrediant(Images.olive,"Olive", <Offset>[Offset(0.15, 0.4),Offset(0.22, 0.4),Offset(0.84, 0.4)]),
    MakeOwnIngrediant(Images.onion,"Onion", <Offset>[Offset(0.95, 0.5),Offset(0.65, 0.5),Offset(0.45, 0.5)]),
    MakeOwnIngrediant(Images.pea,"Pea", <Offset>[Offset(0.3, 0.6),Offset(0.64, 0.6),Offset(0.0, 0.6)]),
    MakeOwnIngrediant(Images.pickle, "Pickle", <Offset>[Offset(0.16, 0.7),Offset(0.61, 0.7),Offset(0.23, 0.7)]),
    MakeOwnIngrediant(Images.potato, "Potato", <Offset>[Offset(0.35, 0.9),Offset(0.53, 0.9),Offset(0.88, 0.9)]),
  ];
  
}
