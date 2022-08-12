import 'package:flutter/material.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/shared/loading_indicator.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';

class CustomToggleButton extends StatelessWidget {
  final bool isCustomerSelected;
  final Function onTap;

  const CustomToggleButton({Key? key, required this.isCustomerSelected, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: context.screenSize().width,
      decoration: BoxDecoration(
        color: AppColors.primary,
        border: Border.all(color: AppColors.darkGrey,width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(5),
      child: Expanded(
        child: Row(
          children: [
            _toggleTile(title: "Customer", isSelected: isCustomerSelected ? true : false, context: context, onTap: (){
              onTap();
            }),
            _toggleTile(title: "Chef/Restaurant", isSelected: isCustomerSelected ? false : true, context: context, onTap: (){
              onTap();
            }),
          ],
        ),
      ),
    );
  }

  _toggleTile({required String title, required bool isSelected, required BuildContext context, required Function onTap}){
    double width = (context.screenSize().width * 0.80) - 60;
    return InkWell(
      onTap: (){
        onTap();
      },
      child: isSelected ? Container(
          height: 56,
          width: width / 2,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child: Text(title,style: TextStyling.normalText.copyWith(fontWeight: FontWeight.w600),))
      ) : Container(
          height: 56,
          width: width / 2,
          child: Center(child: Text(title,style: TextStyling.normalText.copyWith(color: AppColors.white)))),
    );
  }
}


class MainButton extends StatelessWidget {
  final String title;
  final Widget? icon;
  final Function onTap;
  final BorderRadiusGeometry? borderRadius;
  final bool isBusy;

  const MainButton(
      {Key? key,
        required this.title,
        required this.isBusy,
        this.icon,
        this.borderRadius,
        required this.onTap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isBusy ? Center(
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Center(child: LoadingIndicator(color: AppColors.white,size: 36,)),
      ),
    ) : GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: context.screenSize().width,
        height: 50,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              color: AppColors.primary,
              boxShadow: AppColors.cardGreyBackgroundShadow,),
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: (icon == null)
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyling.h4
                      .copyWith(color: AppColors.white),
                ),
              ),
              (icon == null)
                  ? Container()
                  : Container(
                width: 24,
                height: 24,
                child: icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


