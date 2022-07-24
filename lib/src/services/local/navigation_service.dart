import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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

}
