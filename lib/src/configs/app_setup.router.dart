// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/product.dart';
import '../models/user.dart';
import '../views/auth/forgot_password/forgot_password_view.dart';
import '../views/auth/login/login_view.dart';
import '../views/auth/signup/signup_view.dart';
import '../views/chef_side/chef_add_products/chef_add_products_view.dart';
import '../views/chef_side/chef_dashboard/chef_dashboard_view.dart';
import '../views/chef_side/chef_orders/chef_orders_view.dart';
import '../views/chef_side/chef_products/chef_products_view.dart';
import '../views/splash/splash_view.dart';
import '../views/user_side/make_own/make_own_view.dart';
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
  static const String makeOwnView = '/make-own-view';
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
    makeOwnView,
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
    RouteDef(Routes.makeOwnView, page: MakeOwnView),
    RouteDef(Routes.chefDashboardView, page: ChefDashboardView),
    RouteDef(Routes.chefOrdersView, page: ChefOrdersView),
    RouteDef(Routes.chefProductsView, page: ChefProductsView),
    RouteDef(Routes.chefAddProductsView, page: ChefAddProductsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SplashView(),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    LoginView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    SignupView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SignupView(),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    ForgotPasswordView: (data) {
      var args = data.getArgs<ForgotPasswordViewArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ForgotPasswordView(
          key: args.key,
          isCustomerSelected: args.isCustomerSelected,
        ),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    UserDashboardView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            UserDashboardView(),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    UserCategoriesView: (data) {
      var args = data.getArgs<UserCategoriesViewArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            UserCategoriesView(
          key: args.key,
          categoryId: args.categoryId,
        ),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    UserCartView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => UserCartView(),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    RestaurantsProductsView: (data) {
      var args = data.getArgs<RestaurantsProductsViewArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RestaurantsProductsView(
          key: args.key,
          chefId: args.chefId,
        ),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    ProductDetailView: (data) {
      var args = data.getArgs<ProductDetailViewArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProductDetailView(
          key: args.key,
          productModel: args.productModel,
          count: args.count,
        ),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    MakeOwnView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => MakeOwnView(),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    ChefDashboardView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ChefDashboardView(),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    ChefOrdersView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ChefOrdersView(),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    ChefProductsView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ChefProductsView(),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
      );
    },
    ChefAddProductsView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ChefAddProductsView(),
        settings: data,
        transitionsBuilder: data.transition ?? TransitionsBuilders.fadeIn,
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

/// UserCategoriesView arguments holder class
class UserCategoriesViewArguments {
  final Key? key;
  final String categoryId;
  UserCategoriesViewArguments({this.key, required this.categoryId});
}

/// RestaurantsProductsView arguments holder class
class RestaurantsProductsViewArguments {
  final Key? key;
  final ChefUser chefId;
  RestaurantsProductsViewArguments({this.key, required this.chefId});
}

/// ProductDetailView arguments holder class
class ProductDetailViewArguments {
  final Key? key;
  final ProductModel productModel;
  final int count;
  ProductDetailViewArguments(
      {this.key, required this.productModel, required this.count});
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
    Key? key,
    required String categoryId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.userCategoriesView,
      arguments: UserCategoriesViewArguments(key: key, categoryId: categoryId),
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
    Key? key,
    required ChefUser chefId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.restaurantsProductsView,
      arguments: RestaurantsProductsViewArguments(key: key, chefId: chefId),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProductDetailView({
    Key? key,
    required ProductModel productModel,
    required int count,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.productDetailView,
      arguments: ProductDetailViewArguments(
          key: key, productModel: productModel, count: count),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMakeOwnView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.makeOwnView,
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
