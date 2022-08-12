import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/configs/app_setup.router.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/buttons.dart';
import 'package:net_chef/src/shared/input_field.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';
import 'package:net_chef/src/views/auth/login/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light),
            child: Scaffold(
              extendBodyBehindAppBar: true,
                body: Stack(
                  children: [
                    Container(
                      height: context.screenSize().height,
                      width: context.screenSize().width,
                      child: SizedBox.shrink(),
                    ),
                    Container(
                      height: context.screenSize().height * 0.63,
                      width: context.screenSize().width,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        image: DecorationImage(
                          image: AssetImage(Images.splashBackground),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: SizedBox.shrink(),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Stack(
                        children: [
                          Container(
                            height: context.screenSize().height,
                            width: context.screenSize().width,
                          ),
                          Positioned(
                              top: context.screenSize().width * 0.30,
                              left: context.screenSize().width * 0.10,
                              right: context.screenSize().width * 0.10,
                              child: Center(
                                  child: Image.asset(
                                Images.logo,
                                height: context.screenSize().width / 2,
                                width: context.screenSize().width / 2,
                              ))),
                          Positioned(
                            bottom: context.screenSize().width * 0.20,
                            left: context.screenSize().width * 0.10,
                            right: context.screenSize().width * 0.10,
                            child: Container(
                              width: context.screenSize().width * 0.80,
                              height: context.screenSize().height * 0.50,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: AppColors.cardGreyBackgroundShadow,
                                border: Border.all(
                                  color: AppColors.lightGrey,
                                ),
                              ),
                              padding: EdgeInsets.all(20),
                              child: Form(
                                child: Builder(
                                  builder: (context) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomToggleButton(
                                          isCustomerSelected:
                                              model.isCustomerSelected,
                                          onTap: () {
                                            model.isCustomerSelected =
                                                !model.isCustomerSelected;
                                            model.notifyListeners();
                                          },
                                        ),
                                        Text(
                                        (model.isCustomerSelected) ? "Login as Customer" : "Login as Restaurant",
                                          style: TextStyling.h4,
                                        ),
                                        Column(
                                          children: [
                                            CustomInput(
                                                isPassword: false,
                                                inputType: TextInputType.emailAddress,
                                                label: "Email",
                                                controller: model.email,
                                                onTap: () {},
                                                hint: "Enter email I’d", onChanged: (String value) {  },),
                                            CustomInput(
                                                isPassword: true,
                                                label: "Password",
                                                controller: model.password,
                                                onTap: () {},
                                                hint: "Enter Password", onChanged: (String value) {  },),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  onTap: (){
                                                    NavService.forgotPassword(arguments: ForgotPasswordViewArguments(isCustomerSelected: model.isCustomerSelected));
                                                  },
                                                  child: Text(
                                                    "Forgot Password?",
                                                    style: TextStyling.paragraphTheme
                                                        .copyWith(color: AppColors.blue),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        MainButton(
                                          title: "Login",
                                          onTap: () {
                                            model.checkValidate(context);
                                          },
                                          isBusy: model.isBusy,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: "Don’t have account?",
                                                style: TextStyling.paragraphTheme,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: "Create Account",
                                                      style: TextStyling.normalText.copyWith(
                                                          fontWeight: FontWeight.w700),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                        NavService.signup();
                                                            }),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          );
        },
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (model) => model.init(context));
  }
}
