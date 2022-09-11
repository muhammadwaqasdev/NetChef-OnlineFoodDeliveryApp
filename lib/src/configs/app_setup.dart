import 'package:net_chef/src/services/local/auth_service.dart';
import 'package:net_chef/src/services/local/cart_service.dart';
import 'package:net_chef/src/services/local/connectivity_service.dart';
import 'package:net_chef/src/services/local/keyboard_service.dart';
import 'package:net_chef/src/services/remote/api_service.dart';
import 'package:net_chef/src/services/remote/firebase_service.dart';
import 'package:net_chef/src/views/auth/forgot_password/forgot_password_view.dart';
import 'package:net_chef/src/views/auth/login/login_view.dart';
import 'package:net_chef/src/views/auth/signup/signup_view.dart';
import 'package:net_chef/src/views/chef_side/chef_add_products/chef_add_products_view.dart';
import 'package:net_chef/src/views/chef_side/chef_dashboard/chef_dashboard_view.dart';
import 'package:net_chef/src/views/chef_side/chef_orders/chef_orders_view.dart';
import 'package:net_chef/src/views/chef_side/chef_products/chef_products_view.dart';
import 'package:net_chef/src/views/splash/splash_view.dart';
import 'package:net_chef/src/views/user_side/make_own/make_own_view.dart';
import 'package:net_chef/src/views/user_side/product_detail/product_detail_view.dart';
import 'package:net_chef/src/views/user_side/restaurants_products/restaurants_products_view.dart';
import 'package:net_chef/src/views/user_side/user_cart/user_cart_view.dart';
import 'package:net_chef/src/views/user_side/user_categories/user_categories_view.dart';
import 'package:net_chef/src/views/user_side/user_dashboard/user_dashboard_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    CustomRoute(page: SplashView, initial: true, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: LoginView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: SignupView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: ForgotPasswordView, transitionsBuilder: TransitionsBuilders.fadeIn),


    CustomRoute(page: UserDashboardView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: UserCategoriesView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: UserCartView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: RestaurantsProductsView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: ProductDetailView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: MakeOwnView, transitionsBuilder: TransitionsBuilders.fadeIn),


    CustomRoute(page: ChefDashboardView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: ChefOrdersView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: ChefProductsView, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: ChefAddProductsView, transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
  dependencies: [
    // Lazy singletons
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ConnectivityService),
    LazySingleton(classType: KeyboardService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: FirebaseService),
    LazySingleton(classType: CartService),
  ],
)
class AppSetup {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
