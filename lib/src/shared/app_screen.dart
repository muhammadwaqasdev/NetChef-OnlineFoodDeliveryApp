import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';

class AppScreen extends StatelessWidget {
  final Widget child;
  final PreferredSize? appBar;
  final Color? statusBarColor;
  final bool extendBodyBehindAppBar;
  final bool isPrimary;
  final bool isHereFloatButton;

  const AppScreen({
    required this.child,
    this.statusBarColor,
    this.isPrimary = true,
    this.isHereFloatButton = false,
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
              floatingActionButton: (isHereFloatButton) ? FloatCustomBtn(title: "Make\nOwn", onTap: (){
                NavService.makeOwn();
              }) : null,
            ),
        );
  }
}

class FloatCustomBtn extends StatelessWidget {
  final String title;
  final Function onTap;

  const FloatCustomBtn({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        height: 85,
        width: 85,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: AppColors.cardOrangeBackgroundShadow
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyling.normalText
              .copyWith(fontSize: 18, color: AppColors.white),
        ),
      ),
    );
  }
}
