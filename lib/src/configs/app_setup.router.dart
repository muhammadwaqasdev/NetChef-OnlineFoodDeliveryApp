// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../views/auth/forgot_password/forgot_password_view.dart';
import '../views/auth/login/login_view.dart';
import '../views/auth/signup/signup_view.dart';
import '../views/chef_side/chef_add_products/chef_add_products_view.dart';
import '../views/chef_side/chef_dashboard/chef_dashboard_view.dart';
import '../views/chef_side/chef_orders/chef_orders_view.dart';
import '../views/chef_side/chef_products/chef_products_view.dart';
import '../views/splash/splash_view.dart';
import '../views/user_side/product_detail/product_detail_view.dart';
import '../views/user_side/restaurants_products/restaurants_products_view.dart';
import '../views/user_side/user_cart/user_cart_view.dart';
import '../views/user_side/user_categories/user_categories_view.dart';
import '../views/user_side/user_dashboard/user_dashboard_view.dart';

class Routes {
  static const String splashView = '/';
  static const String loginView = '/login-view';
  static const String signupView = '/signup-view';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String userDashboardView = '/user-dashboard-view';
  static const String userCategoriesView = '/user-categories-view';
  static const String userCartView = '/user-cart-view';
  static const String restaurantsProductsView = '/restaurants-products-view';
  static const String productDetailView = '/product-detail-view';
  static const String chefDashboardView = '/chef-dashboard-view';
  static const String chefOrdersView = '/chef-orders-view';
  static const String chefProductsView = '/chef-products-view';
  static const String chefAddProductsView = '/chef-add-products-view';
  static const all = <String>{
    splashView,
    loginView,
    signupView,
    forgotPasswordView,
    userDashboardView,
    userCategoriesView,
    userCartView,
    restaurantsProductsView,
    productDetailView,
    chefDashboardView,
    chefOrdersView,
    chefProductsView,
    chefAddProductsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signupView, page: SignupView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPasswordView),
    RouteDef(Routes.userDashboardView, page: UserDashboardView),
    RouteDef(Routes.userCategoriesView, page: UserCategoriesView),
    RouteDef(Routes.userCartView, page: UserCartView),
    RouteDef(Routes.restaurantsProductsView, page: RestaurantsProductsView),
    RouteDef(Routes.productDetailView, page: ProductDetailView),
    RouteDef(Routes.chefDashboardView, page: ChefDashboardView),
    RouteDef(Routes.chefOrdersView, page: ChefOrdersView),
    RouteDef(Routes.chefProductsView, page: ChefProductsView),
    RouteDef(Routes.chefAddProductsView, page: ChefAddProductsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignupView(),
        settings: data,
      );
    },
    ForgotPasswordView: (data) {
      var args = data.getArgs<ForgotPasswordViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ForgotPasswordView(
          key: args.key,
          isCustomerSelected: args.isCustomerSelected,
        ),
        settings: data,
      );
    },
    UserDashboardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserDashboardView(),
        settings: data,
      );
    },
    UserCategoriesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserCategoriesView(),
        settings: data,
      );
    },
    UserCartView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserCartView(),
        settings: data,
      );
    },
    RestaurantsProductsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RestaurantsProductsView(),
        settings: data,
      );
    },
    ProductDetailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductDetailView(),
        settings: data,
      );
    },
    ChefDashboardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChefDashboardView(),
        settings: data,
      );
    },
    ChefOrdersView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChefOrdersView(),
        settings: data,
      );
    },
    ChefProductsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChefProductsView(),
        settings: data,
      );
    },
    ChefAddProductsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChefAddProductsView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ForgotPasswordView arguments holder class
class ForgotPasswordViewArguments {
  final Key? key;
  final bool isCustomerSelected;
  ForgotPasswordViewArguments({this.key, required this.isCustomerSelected});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToSplashView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.splashView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.loginView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSignupView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.signupView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToForgotPasswordView({
    Key? key,
    required bool isCustomerSelected,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.forgotPasswordView,
      arguments: ForgotPasswordViewArguments(
          key: key, isCustomerSelected: isCustomerSelected),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToUserDashboardView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.userDashboardView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToUserCategoriesView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.userCategoriesView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToUserCartView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.userCartView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRestaurantsProductsView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.restaurantsProductsView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProductDetailView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.productDetailView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChefDashboardView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.chefDashboardView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChefOrdersView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.chefOrdersView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChefProductsView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.chefProductsView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChefAddProductsView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.chefAddProductsView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
