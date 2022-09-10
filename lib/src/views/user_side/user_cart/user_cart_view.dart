import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/app_screen.dart';
import 'package:net_chef/src/shared/buttons.dart';
import 'package:net_chef/src/shared/user/user_app_bar.dart';
import 'package:net_chef/src/shared/drawer_container.dart';
import 'package:net_chef/src/shared/search_field.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/shared/user/user_cart_tile.dart';
import 'package:net_chef/src/shared/user/user_drawer.dart';
import 'package:net_chef/src/shared/user/resturent_cart.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';
import 'package:net_chef/src/views/user_side/user_cart/user_cart_view_model.dart';
import 'package:net_chef/src/views/user_side/user_categories/user_categories_view_model.dart';
import 'package:net_chef/src/views/user_side/user_dashboard/user_dashboard_view_model.dart';
import 'package:stacked/stacked.dart';

class UserCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserCartViewModel>.reactive(
        builder: (context, model, child) {
          return AppScreen(
              appBar: UserSecondaryAppBar(
                isCart: true,
                title: "Cart",
                cartCount: model.cartService.totalQuantity,
                onProfileTap: () => () {},
                onBackTap: () => Navigator.pop(context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: context
                        .screenSize()
                        .height - 230,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: model.cartService.cartProducts.length,
                        itemBuilder: (context, index) {
                          return CartTile(cartProductModel: model.cartService.cartProducts[index], onDelete: (){
                            model.cartService.cartProducts.remove(model.cartService.cartProducts[index]);
                            model.cartService.totalQuantity = (model.cartService.totalQuantity!.toDouble() - double.parse(model.cartService.cartProducts[index].quantity ?? "0")).toInt();
                            model.cartService.totalAmount = (model.cartService.totalAmount!.toDouble() - double.parse(model.cartService.cartProducts[index].totalItemPrice ?? "0")).toInt();
                          },);
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Total Items: ",
                              style: TextStyling.h4
                                  .copyWith(color: AppColors.black),
                            ),
                            Text(
                              "${model.cartService.totalQuantity.toString()}",
                              style: TextStyling.h4
                                  .copyWith(color: AppColors.primary),
                            ),
                          ],
                        ),
                        VerticalSpacing(15),
                        Row(
                          children: [
                            Text(
                              "Total Amount: ",
                              style: TextStyling.h4
                                  .copyWith(color: AppColors.black),
                            ),
                            Text(
                              "${model.cartService.totalAmount.toString()} PKR",
                              style: TextStyling.h4
                                  .copyWith(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  VerticalSpacing(5),
                  MainButton(title: "Place Order", onTap: (){
                    model.onOrder(context);
                  },borderRadius: BorderRadius.zero,
                    isBusy: model.isBusy,),
                ],
              ));
        },
        viewModelBuilder: () => UserCartViewModel(),
        onModelReady: (model) => model.init(context));
  }
}
