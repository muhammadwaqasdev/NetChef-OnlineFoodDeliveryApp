import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/app_screen.dart';
import 'package:net_chef/src/shared/loading_indicator.dart';
import 'package:net_chef/src/shared/user/product_tile.dart';
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
  final String categoryId;

  const UserCategoriesView({Key? key, required this.categoryId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserCategoriesViewModel>.reactive(
        builder: (context, model, child) {
          return AppScreen(
              appBar: UserSecondaryAppBar(
                isCart: false,
                cartCount: model.cartService.totalQuantity,
                title: "Burger",
                onProfileTap: () => NavService.userCart(),
                onBackTap: () => Navigator.pop(context),
              ),
              child: (model.isBusy) ?
              Center(child: LoadingIndicator(color: AppColors.primary,)) :
              (model.productModel.length > 0) ?
              SizedBox(
                height: context.screenSize().height - 355,
                child: GridView.builder(
                  itemCount: model.productModel.length,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 21.0,
                      mainAxisSpacing: 21.0),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductTile(
                        title: model.productModel[index].pName ?? "",
                        image: model.productModel[index].pic ?? "",
                        price: "Rs.${model.productModel[index].pPrice}",
                        quantity: model.productSelectedCount[index],
                        onCartTap: () {},
                        onPlusTap: () {
                          model.productSelectedCount[index]++;
                          model.notifyListeners();
                        },
                        onMinusTap: () {
                          if(model.productSelectedCount[index] > 0){
                            model.productSelectedCount[index]--;
                            model.notifyListeners();
                          }
                        },
                        onTap: () {
                          NavService.productDetail();
                        });
                  },
                ),
              ) :
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Products Not Available",style: TextStyling.normalText.copyWith(color: AppColors.darkGrey),),
                  ],
                ),
              ));
        },
        viewModelBuilder: () => UserCategoriesViewModel(categoryId: categoryId),
        onModelReady: (model) => model.init(context,(model.productModel.length + 1)));
  }
}
