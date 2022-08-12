import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RestaurantsProductsViewModel extends BaseViewModel {

  int selectedIndex = 0;
  List<int> productSelectedCount = [];
  init(BuildContext context,int totalProducts) {
    for(int i = 0; i < totalProducts; i++){
      productSelectedCount.add(0);
    }
  }
}
