import 'package:flutter/material.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';

class CartTile extends StatelessWidget {
  const CartTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppColors.cardOrangeBackgroundShadow,
        borderRadius: BorderRadius.circular(12)
      ),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      boxShadow: AppColors.cardGreyBackgroundShadow,
                    ),
                    child: ClipRRect(
                      // height: 50,
                      // width: 50,
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  HorizontalSpacing(),
                  Text(
                    "Zinger Burger",
                    style: TextStyling.h2
                        .copyWith(color: AppColors.black.withOpacity(0.6)),
                  ),
                  Spacer(),
                  Text(
                    "Quantity: ",
                    style: TextStyling.normalText
                        .copyWith(color: AppColors.black),
                  ),
                  Text(
                    "10",
                    style: TextStyling.normalText
                        .copyWith(color: AppColors.primary),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Per Item Cost: ",
                        style: TextStyling.h4
                            .copyWith(color: AppColors.black),
                      ),
                      Text(
                        "150 PKR",
                        style: TextStyling.h4
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  VerticalSpacing(5),
                  Row(
                    children: [
                      Text(
                        "Total Cost: ",
                        style: TextStyling.h4
                            .copyWith(color: AppColors.black),
                      ),
                      Text(
                        "1500 PKR",
                        style: TextStyling.h4
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  VerticalSpacing(5),
                  Row(
                    children: [
                      Text(
                        "GST 18%: ",
                        style: TextStyling.h4
                            .copyWith(color: AppColors.black),
                      ),
                      Text(
                        "250 PKR",
                        style: TextStyling.h4
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  VerticalSpacing(5),
                  Row(
                    children: [
                      Text(
                        "Discount: ",
                        style: TextStyling.h4
                            .copyWith(color: AppColors.black),
                      ),
                      Text(
                        "150 PKR",
                        style: TextStyling.h4
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Total: ",
                    style: TextStyling.h3
                        .copyWith(color: AppColors.black),
                  ),
                  Text(
                    "1200 PKR",
                    style: TextStyling.h3
                        .copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(Icons.delete_forever_outlined,color: AppColors.primary,size: 24,),
          )
        ],
      ),
    );
  }
}
