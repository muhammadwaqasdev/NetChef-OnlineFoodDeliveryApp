import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/app_screen.dart';
import 'package:net_chef/src/shared/user/user_app_bar.dart';
import 'package:net_chef/src/shared/drawer_container.dart';
import 'package:net_chef/src/shared/search_field.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/shared/user/user_drawer.dart';
import 'package:net_chef/src/shared/user/resturent_cart.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';
import 'package:net_chef/src/views/user_side/user_categories/user_categories_view_model.dart';
import 'package:net_chef/src/views/user_side/user_dashboard/user_dashboard_view_model.dart';
import 'package:stacked/stacked.dart';

class UserCategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserCategoriesViewModel>.reactive(
        builder: (context, model, child) {
          return AppScreen(
              appBar: UserSecondaryAppBar(
                isCart: false,
                title: "Burger",
                onProfileTap: () => NavService.userCart(),
                onBackTap: () => Navigator.pop(context),
              ),
              child: SizedBox(
                height: context.screenSize().height,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return RestaurantCart(onTap: (){
                        NavService.restaurantsProducts();
                      },);
                    }),
              ));
        },
        viewModelBuilder: () => UserCategoriesViewModel(),
        onModelReady: (model) => model.init(context));
  }
}
