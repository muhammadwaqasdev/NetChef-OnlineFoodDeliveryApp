import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/app_screen.dart';
import 'package:net_chef/src/shared/chef/chef_app_bar.dart';
import 'package:net_chef/src/shared/chef/chef_drawer.dart';
import 'package:net_chef/src/shared/chef/chef_product_tile.dart';
import 'package:net_chef/src/shared/chef/order_tile.dart';
import 'package:net_chef/src/shared/loading_indicator.dart';
import 'package:net_chef/src/shared/user/user_app_bar.dart';
import 'package:net_chef/src/shared/drawer_container.dart';
import 'package:net_chef/src/shared/search_field.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/shared/user/user_drawer.dart';
import 'package:net_chef/src/shared/user/resturent_cart.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';
import 'package:net_chef/src/views/chef_side/chef_dashboard/chef_dashboard_view_model.dart';
import 'package:net_chef/src/views/chef_side/chef_orders/chef_orders_view_model.dart';
import 'package:net_chef/src/views/chef_side/chef_products/chef_products_view_model.dart';
import 'package:net_chef/src/views/user_side/user_dashboard/user_dashboard_view_model.dart';
import 'package:stacked/stacked.dart';

class ChefProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChefProductsViewModel>.reactive(
        builder: (context, model, child) {
          return DrawerContainer(
            enableSwipe: true,
            controller: model.drawerContainerController,
            drawer: ChefDrawer(
              onDrawerCloseTap: model.drawerContainerController.toggleDrawer,
              isGoalSetup: true,
              user: model.currentUser,
            ),
            body: AppScreen(
                appBar: ChefPrimaryAppBar(
                  onDrawerIconTap: () =>
                      model.drawerContainerController.toggleDrawer(),
                  onSyncTap: () => (){},
                  isProductPage: true,
                  user: model.currentUser,
                ),
                child:(model.isBusy == false) ? Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        children: [
                          Text(
                            "Products",
                            style: TextStyling.h2
                                .copyWith(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.screenSize().height - 165,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ChefProductCart(onTap: (){});
                          }),
                    ),
                  ],
                ) : Center(child: LoadingIndicator(color: AppColors.primary,size: 48,),)),
          );
        },
        viewModelBuilder: () => ChefProductsViewModel(),
        onModelReady: (model) => model.init(context));
  }

  _categoryTile({required int index, required int totalCount, required Function onTap}) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        height: 30,
        margin: EdgeInsets.fromLTRB(
            (index == 0) ? 19 : 10, 0, (index == (totalCount - 1)) ? 20 : 0, 0),
        decoration: BoxDecoration(
            color: AppColors.primary, borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.fromLTRB(12, 0, 15, 0),
        child: Row(
          children: [
            Image.asset(
              Images.burgerVector,
              height: 24,
              width: 24,
            ),
            HorizontalSpacing(10),
            Text(
              "Burger",
              style: TextStyling.normalText.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
