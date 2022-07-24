import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/configs/app_setup.router.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/views/auth/login/login_view_model.dart';
import 'package:net_chef/src/views/splash/splash_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:net_chef/src/base/utils/utils.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
              body: Container(
                height: context.screenSize().height,
                width: context.screenSize().width,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  image: DecorationImage(image: AssetImage(Images.splashBackground),fit: BoxFit.fill,),
                ),
                child: Center(child: Image.asset(Images.logo,height: context.screenSize().width / 2,width: context.screenSize().width / 2,))
              ));
        },
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (model) => model.init(context));
  }
}
