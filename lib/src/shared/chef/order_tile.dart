import 'package:flutter/material.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';

class OrderTile extends StatelessWidget {
  final String orderId;
  final String date;
  final String amount;
  final OrderStatus orderStatus;

  const OrderTile({Key? key, required this.orderId, required this.date, required this.amount, required this.orderStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenSize().width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardOrangeBackgroundShadow,
      ),
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("#$orderId",style: TextStyling.h3.copyWith(color: AppColors.red),),
              Text(date,style: TextStyling.h4.copyWith(color: AppColors.black),),
            ],
          ),
          VerticalSpacing(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(amount,style: TextStyling.h3.copyWith(color: AppColors.black),),
              Text(orderStatus.name,style: TextStyling.h3.copyWith(color: (orderStatus == OrderStatus.PENDING || orderStatus == OrderStatus.CANCELED) ? AppColors.primary : (orderStatus == OrderStatus.CLEARED || orderStatus == OrderStatus.FULFILLED) ? Colors.green : AppColors.primary),),
            ],
          ),
        ],
      ),
    );
  }
}
