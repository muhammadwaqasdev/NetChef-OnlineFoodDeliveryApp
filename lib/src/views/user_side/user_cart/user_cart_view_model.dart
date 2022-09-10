import 'package:flutter/cupertino.dart';
import 'package:net_chef/src/models/order.dart';
import 'package:net_chef/src/services/local/base/cart_service_view_model.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/services/remote/base/firebase_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

class UserCartViewModel extends ReactiveViewModel with CartServiceViewModel, FirebaseViewModel {
  init(BuildContext context) {

  }
  onOrder(BuildContext context) async {
    setBusy(true);

    List<String> VId = [];
    cartService.cartProducts.forEach((element) {
      if(!VId.contains(element.resturentid.toString())){
        VId.add(element.resturentid.toString());
      }
    });
    Order order = Order(
      createdBy: DateTime.now().toString(),
      id: Uuid().v4(),
      itemCount: cartService.totalQuantity,
      items: cartService.cartProducts,
      totalAmount: cartService.totalAmount.toString(),
      updatedBy: DateTime.now().toString(),
      venderId: VId,
    );

    bool isDone = await firebaseService.createOrder(context, order);
    if(isDone){
      cartService.clear();
      NavService.userDashboard();
    }

    setBusy(false);
  }
}
