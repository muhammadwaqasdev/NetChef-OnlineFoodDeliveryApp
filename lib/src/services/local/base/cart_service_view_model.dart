import 'package:net_chef/src/configs/app_setup.locator.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/auth_service.dart';
import 'package:net_chef/src/services/local/cart_service.dart';
import 'package:stacked/stacked.dart';

mixin CartServiceViewModel on ReactiveViewModel {
  CartService _cartService = locator<CartService>();

  CartService get cartService => _cartService;


  @override
  List<ReactiveServiceMixin> get reactiveServices => [_cartService];
}
