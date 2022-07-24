import 'package:net_chef/src/services/local/auth_service.dart';
import 'package:net_chef/src/services/local/connectivity_service.dart';
import 'package:net_chef/src/services/local/keyboard_service.dart';
import 'package:net_chef/src/services/remote/api_service.dart';
import 'package:net_chef/src/views/auth/login/login_view.dart';
import 'package:net_chef/src/views/auth/signup/signup_view.dart';
import 'package:net_chef/src/views/splash/splash_view.dart';
import 'package:net_chef/src/views/user_side/user_dashboard/user_dashboard_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: UserDashboardView),
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
  ],
)
class AppSetup {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
