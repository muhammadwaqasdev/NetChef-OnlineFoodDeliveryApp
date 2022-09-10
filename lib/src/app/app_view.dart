import 'package:flutter/material.dart';
import 'package:net_chef/src/base/utils/constants.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/views/splash/splash_view.dart';
import 'package:net_chef/src/views/user_side/make_own/make_own_view.dart';

class AppView extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavService.onGenerateRoute,
      navigatorKey: NavService.key,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(),),
      home: SplashView(),
      builder: (context, child) {
        return Stack(
          children: [child!],
        );
      },
    );
  }
}
