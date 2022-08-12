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
                onProfileTap: () => () {},
                onBackTap: () => Navigator.pop(context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: context
                        .screenSize()
                        .height - 170,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return CartTile();
                        }),
                  ),
                  MainButton(title: "Place Order", onTap: (){
                    NavService.userDashboard();
                  },borderRadius: BorderRadius.zero,
                    isBusy: model.isBusy,),
                ],
              ));
        },
        viewModelBuilder: () => UserCartViewModel(),
        onModelReady: (model) => model.init(context));
  }
}
