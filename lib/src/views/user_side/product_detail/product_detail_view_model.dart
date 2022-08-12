import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductDetailViewModel extends BaseViewModel {

  int productSelectedCount = 0;
  int selectedIndex = 0;
  List<bool> isSelected = [];
  init(BuildContext context,int totalProducts) {
    for(int i = 0; i < totalProducts; i++){
      isSelected.add(false);
    }
  }
}
