import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/shared/app_bar.dart';
import 'package:net_chef/src/shared/app_screen.dart';
import 'package:net_chef/src/shared/buttons.dart';
import 'package:net_chef/src/shared/input_field.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';
import 'package:net_chef/src/views/auth/forgot_password/forgot_password_view_model.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StatelessWidget {
  final bool isCustomerSelected;

  const ForgotPasswordView({Key? key, required this.isCustomerSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
        builder: (context, model, child) {
          return AppScreen(
            extendBodyBehindAppBar: true,
              appBar: CustomAppBar(),
              child: Stack(
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
                          bottom: context.screenSize().width * 0.50,
                          left: context.screenSize().width * 0.10,
                          right: context.screenSize().width * 0.10,
                          child: Container(
                            width: context.screenSize().width * 0.80,
                            height: context.screenSize().height * 0.30,
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
                                      Text(
                                        "Forgot Password as ${isCustomerSelected ? "Customer" : "Chef / Restaurant"}",
                                        style: TextStyling.h4,
                                      ),
                                      CustomInput(
                                          isPassword: false,
                                          inputType: TextInputType.emailAddress,
                                          label: "Email",
                                          controller: model.email,
                                          onTap: () {},
                                          hint: "Enter email I’d", onChanged: (String value) {  },),
                                      MainButton(
                                        title: "Forgot Password",
                                        onTap: () {
                                          model.checkValidate(context);
                                        },
                                        isBusy: model.isBusy,
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
              ));
        },
        viewModelBuilder: () => ForgotPasswordViewModel(),
        onModelReady: (model) => model.init(context));
  }
}
