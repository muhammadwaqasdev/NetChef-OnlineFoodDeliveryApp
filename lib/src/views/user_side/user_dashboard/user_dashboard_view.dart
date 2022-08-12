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
import 'package:net_chef/src/views/user_side/user_dashboard/user_dashboard_view_model.dart';
import 'package:stacked/stacked.dart';

class UserDashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserDashboardViewModel>.reactive(
        builder: (context, model, child) {
          return DrawerContainer(
            enableSwipe: true,
            controller: model.drawerContainerController,
            drawer: UserDrawer(
              onDrawerCloseTap: model.drawerContainerController.toggleDrawer,
              isGoalSetup: true,
              user: model.currentUser,
            ),
            body: AppScreen(
                appBar: UserPrimaryAppBar(
                  onDrawerIconTap: () =>
                      model.drawerContainerController.toggleDrawer(),
                  onGoCartTap: () => NavService.userCart(),
                ),
                child: Column(
                  children: [
                    SearchInput(onChanged: (val) {},onFieldSubmitted: (val){}),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        children: [
                          Text(
                            "Categories",
                            style: TextStyling.h3
                                .copyWith(color: AppColors.darkGrey),
                          ),
                        ],
                      ),
                    ),
                    VerticalSpacing(10),
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (itemBuilder, a) {
                            return _categoryTile(index: a, totalCount: 10,onTap: (){
                              NavService.userCategories();
                            });
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        children: [
                          Text(
                            "Top Restaurants",
                            style: TextStyling.h2
                                .copyWith(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.screenSize().height - 310,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return RestaurantCart(onTap: (){
                              NavService.restaurantsProducts();
                            },);
                          }),
                    ),
                  ],
                )),
          );
        },
        viewModelBuilder: () => UserDashboardViewModel(),
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
