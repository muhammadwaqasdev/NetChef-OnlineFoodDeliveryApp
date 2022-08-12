import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/src/configs/app_setup.locator.dart';
import 'package:net_chef/src/configs/app_setup.router.dart';
import 'package:stacked_services/stacked_services.dart';

class NavService {
  static NavigationService? _navigationService = locator<NavigationService>();

  // key
  static GlobalKey<NavigatorState>? get key => StackedService.navigatorKey;
  //
  // // key for nested navigator to be used in SplashView
  // static final _splashViewNavigatorId = 0;
  //
  // static GlobalKey<NavigatorState>? get nestedNavKey =>
  //     StackedService.nestedNavigationKey(_splashViewNavigatorId);

  // on generate route
  static Route<dynamic>? Function(RouteSettings) get onGenerateRoute =>
      StackedRouter().onGenerateRoute;


  // nested routes with args for root navigator
  static Future<dynamic>? splash({dynamic arguments}) => _navigationService!
      .clearStackAndShow(Routes.splashView, arguments: arguments);

  static Future<dynamic>? login({dynamic arguments}) => _navigationService!
      .clearStackAndShow(Routes.loginView, arguments: arguments);

  static Future<dynamic>? signup({dynamic arguments}) => _navigationService!
      .clearStackAndShow(Routes.signupView, arguments: arguments);

  static Future<dynamic>? forgotPassword({dynamic arguments}) => _navigationService!
      .navigateTo(Routes.forgotPasswordView, arguments: arguments);




  static Future<dynamic>? userDashboard({dynamic arguments}) => _navigationService!
      .clearStackAndShow(Routes.userDashboardView, arguments: arguments);

  static Future<dynamic>? userCategories({dynamic arguments}) => _navigationService!
      .navigateTo(Routes.userCategoriesView, arguments: arguments);

  static Future<dynamic>? userCart({dynamic arguments}) => _navigationService!
      .navigateTo(Routes.userCartView, arguments: arguments);

  static Future<dynamic>? restaurantsProducts({dynamic arguments}) => _navigationService!
      .navigateTo(Routes.restaurantsProductsView, arguments: arguments);

  static Future<dynamic>? productDetail({dynamic arguments}) => _navigationService!
      .navigateTo(Routes.productDetailView, arguments: arguments);




  static Future<dynamic>? chefDashboard({dynamic arguments}) => _navigationService!
      .clearStackAndShow(Routes.chefDashboardView, arguments: arguments);

  static Future<dynamic>? chefOrders({dynamic arguments}) => _navigationService!
      .navigateTo(Routes.chefOrdersView, arguments: arguments);

  static Future<dynamic>? chefProducts({dynamic arguments}) => _navigationService!
      .navigateTo(Routes.chefProductsView, arguments: arguments);
}
