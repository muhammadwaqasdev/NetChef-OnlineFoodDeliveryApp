import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_chef/src/styles/app_colors.dart';

class AppScreen extends StatelessWidget {
  final Widget child;
  final PreferredSize? appBar;
  final Color? statusBarColor;

  const AppScreen(
      {required this.child,
        this.statusBarColor,
      this.appBar,});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: statusBarColor ?? AppColors.primary,
            statusBarIconBrightness: Brightness.light),
        child: Scaffold(
                appBar: appBar,
                body: child,
              ));
  }
}

