import 'package:net_chef/src/services/local/auth_service.dart';
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
import 'package:net_chef/src/views/user_side/product_detail/product_detail_view.dart';
import 'package:net_chef/src/views/user_side/restaurants_products/restaurants_products_view.dart';
import 'package:net_chef/src/views/user_side/user_cart/user_cart_view.dart';
import 'package:net_chef/src/views/user_side/user_categories/user_categories_view.dart';
import 'package:net_chef/src/views/user_side/user_dashboard/user_dashboard_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: ForgotPasswordView),


    MaterialRoute(page: UserDashboardView),
    MaterialRoute(page: UserCategoriesView),
    MaterialRoute(page: UserCartView),
    MaterialRoute(page: RestaurantsProductsView),
    MaterialRoute(page: ProductDetailView),


    MaterialRoute(page: ChefDashboardView),
    MaterialRoute(page: ChefOrdersView),
    MaterialRoute(page: ChefProductsView),
    MaterialRoute(page: ChefAddProductsView),
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
  ],
)
class AppSetup {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
