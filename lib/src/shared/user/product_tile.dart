import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';

class ProductTile extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final int quantity;
  final Function onCartTap;
  final Function onPlusTap;
  final Function onMinusTap;
  final Function onTap;

  const ProductTile(
      {Key? key,
      required this.title,
      required this.image,
      required this.price,
      required this.quantity,
      required this.onCartTap,
      required this.onPlusTap,
      required this.onMinusTap,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (context.screenSize().width - 60) / 2,
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardOrangeBackgroundShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VerticalSpacing(10),
          Text(
            title,
            style: TextStyling.h4.copyWith(color: AppColors.darkGrey),
          ),
          Image.network(
            image,
            height: 84,
            width: 84,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    onMinusTap();
                  },
                  child: Image.asset(
                    Images.minusVector,
                    height: 24,
                    width: 24,
                  )),
              HorizontalSpacing(),
              Text(
                quantity.toString(),
                style: TextStyling.h4.copyWith(
                    color: (quantity > 0)
                        ? AppColors.primary
                        : AppColors.darkGrey),
              ),
              HorizontalSpacing(),
              InkWell(
                  onTap: () {
                    onPlusTap();
                  },
                  child: Image.asset(
                    Images.plusVector,
                    height: 24,
                    width: 24,
                  )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(12)),
                  ),
                  child: Center(
                      child: Text(
                    price,
                    style: TextStyling.h4.copyWith(color: AppColors.white),
                  )),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    onTap();
                  },
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12)),
                    ),
                    child: Image.asset(
                      Images.cartNewVectorWhite,
                      height: 24,
                      width: 24,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
