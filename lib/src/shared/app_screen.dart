import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_chef/src/styles/app_colors.dart';

class AppScreen extends StatelessWidget {
  final Widget child;
  final PreferredSize? appBar;
  final Color? statusBarColor;
  final bool extendBodyBehindAppBar;
  final bool isPrimary;

  const AppScreen({
    required this.child,
    this.statusBarColor,
    this.isPrimary = true,
    this.extendBodyBehindAppBar = false,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return isPrimary
        ? AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
                statusBarColor: statusBarColor ?? AppColors.primary,
                statusBarIconBrightness: Brightness.light),
            child: SafeArea(
              child: Scaffold(
                extendBodyBehindAppBar: extendBodyBehindAppBar,
                appBar: appBar,
                body: child,
              ),
            ))
        : AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
          child: Scaffold(
              extendBodyBehindAppBar: extendBodyBehindAppBar,
              appBar: appBar,
              body: child,
            ),
        );
  }
}
