import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/views/splash/splash_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        builder: (context, model, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light),
            child: Scaffold(
                body: Container(
                  height: context.screenSize().height,
                  width: context.screenSize().width,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    image: DecorationImage(image: AssetImage(Images.splashBackground),fit: BoxFit.fill,),
                  ),
                  child: Center(child: Image.asset(Images.logo,height: context.screenSize().width / 2,width: context.screenSize().width / 2,))
                )),
          );
        },
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (model) => model.init(context));
  }
}
