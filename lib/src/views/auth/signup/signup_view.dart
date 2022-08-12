import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/buttons.dart';
import 'package:net_chef/src/shared/input_field.dart';
import 'package:net_chef/src/shared/load_image.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';
import 'package:net_chef/src/views/auth/signup/signup_view_model.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
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
                      height: context.screenSize().height * 0.30,
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
                      child: Column(
                        children: [
                          VerticalSpacing(20),
                          Center(
                              child: Image.asset(
                                Images.logo,
                                height: context.screenSize().width / 2,
                                width: context.screenSize().width / 2,
                              )),
                          Container(
                            width: context.screenSize().width * 0.80,
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
                                        VerticalSpacing(30),
                                        Text(
                                          (model.isCustomerSelected) ? "Login as Customer" : "Login as Restaurant",
                                          style: TextStyling.h4,
                                        ),
                                        VerticalSpacing(10),
                                        Column(
                                          children: [
                                            LoadImage(model.profilePicture,
                                              size: Size(110, 110),
                                              isCircle: true,
                                              pickedImage: model.uploadImage,
                                              isUploadLoader: model.isBusy,
                                              hasPickOption: true,
                                            ),
                                            VerticalSpacing(),
                                            if (model.isCustomerSelected == false) CustomInput(
                                              isPassword: false,
                                              label: "Business Name",
                                              inputType: TextInputType.text,
                                              controller: model.businessName,
                                              onTap: () {},
                                              hint: "Enter your business Name",
                                              onChanged: (String value) {  },),
                                            CustomInput(
                                              isPassword: false,
                                              inputType: TextInputType.text,
                                              label: "Full Name",
                                              controller: model.fullName,
                                              onTap: () {},
                                              hint: "Enter your full Name", onChanged: (String value) {  },),
                                            CustomInput(
                                              isPassword: false,
                                              label: "Phone Number",
                                              inputType: TextInputType.phone,
                                              controller: model.phoneNumber,
                                              onTap: () {},
                                              hint: "Enter your phone number", onChanged: (String value) {  },),
                                            CustomInput(
                                              isPassword: false,
                                              label: "Identity Number",
                                              inputType: TextInputType.text,
                                              controller: model.identityNumber,
                                              onTap: () {},
                                              hint: "Enter your identity number", onChanged: (String value) {  },),
                                            CustomInput(
                                              isPassword: false,
                                              inputType: TextInputType.text,
                                              label: "Gender",
                                              controller: model.gender,
                                              onTap: () {},
                                              hint: "Enter your gender", onChanged: (String value) {  },),
                                            CustomInput(
                                              isPassword: false,
                                              label: "Email Address",
                                              inputType: TextInputType.emailAddress,
                                              controller: model.email,
                                              onTap: () {},
                                              hint: "Enter your email address", onChanged: (String value) {  },),
                                            CustomInput(
                                              isPassword: true,
                                              inputType: TextInputType.visiblePassword,
                                              label: "Password",
                                              controller: model.password,
                                              onTap: () {},
                                              hint: "Enter your password", onChanged: (String value) {  },),
                                            CustomInput(
                                              isPassword: false,
                                              label: "Address",
                                              inputType: TextInputType.multiline,
                                              controller: model.address,
                                              onTap: () {},
                                              hint: "Enter your complete address", onChanged: (String value) {  },),
                                          ],
                                        ),
                                        VerticalSpacing(30),
                                        MainButton(
                                          title: "Signup",
                                          onTap: () {
                                            model.checkValidate(context);
                                          },
                                          isBusy: model.isBusy,
                                        ),
                                        VerticalSpacing(10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: "Already have account ",
                                                style: TextStyling.paragraphTheme,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: "Sign In",
                                                      style: TextStyling.normalText.copyWith(
                                                          fontWeight: FontWeight.w700),
                                                      recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          NavService.login();
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
                          VerticalSpacing(20),
                        ],
                      ),
                    )
                  ],
                )),
          );
        },
        viewModelBuilder: () => SignupViewModel(),
        onModelReady: (model) => model.init(context));
  }
}
