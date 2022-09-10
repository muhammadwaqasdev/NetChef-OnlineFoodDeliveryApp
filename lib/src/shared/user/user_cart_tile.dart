import 'package:flutter/material.dart';
import 'package:net_chef/src/models/cart_product_model.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';

class CartTile extends StatelessWidget {
  final CartProductModel cartProductModel;
  final Function onDelete;
  const CartTile({Key? key, required this.cartProductModel, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
                  Text(
                    cartProductModel.productName.toString(),
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
                    cartProductModel.quantity.toString(),
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
                        "${cartProductModel.eachItemPrice.toString()} PKR",
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
                        "${cartProductModel.totalItemPrice.toString()} PKR",
                        style: TextStyling.h4
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: (){
                onDelete();
              },
                child: Icon(Icons.delete_forever_outlined,color: AppColors.primary,size: 24,)),
          ),
        ],
      ),
    );
  }
}
