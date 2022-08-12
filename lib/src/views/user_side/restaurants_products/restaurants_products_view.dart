import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/app_screen.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/shared/user/product_tile.dart';
import 'package:net_chef/src/shared/user/user_app_bar.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';
import 'package:net_chef/src/views/user_side/restaurants_products/restaurants_products_view_model.dart';
import 'package:stacked/stacked.dart';

class RestaurantsProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RestaurantsProductsViewModel>.reactive(
        builder: (context, model, child) {
          return AppScreen(
              isPrimary: false,
              child: Stack(
                children: [
                  Image.asset(
                    Images.foodImage,
                    fit: BoxFit.cover,
                    width: context.screenSize().width,
                    height: 220,
                  ),
                  Column(
                    children: [
                      UserSecondaryAppBar(
                        isCart: false,
                        title: "Cart",
                        onProfileTap: () => NavService.userCart(),
                        onBackTap: () => Navigator.pop(context),
                      ),
                      Container(
                        width: 230,
                        height: 150,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 230,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow:
                                      AppColors.cardOrangeBackgroundShadow,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                width: 55,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Images.star,
                                      height: 18,
                                      width: 18,
                                    ),
                                    HorizontalSpacing(5),
                                    Text("4.9",
                                        style: TextStyling.normalText.copyWith(
                                            color: AppColors.darkGrey,
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 95,
                                width: 95,
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
                            ),
                            Positioned(
                              bottom: 15,
                              left: 0,
                              right: 0,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Burger King ",
                                  style: TextStyling.h1
                                      .copyWith(color: AppColors.primary),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                            itemBuilder: (itemBuilder, index) {
                              return _categoryTile(
                                  index: index,
                                  totalCount: 10,
                                  onTap: () {
                                    model.selectedIndex = index;
                                    model.notifyListeners();
                                  },
                                  selectedIndex: model.selectedIndex);
                            }),
                      ),
                      SizedBox(
                        height: context.screenSize().height - 355,
                        child: GridView.builder(
                          itemCount: 10,
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
                                title: "Zinger Burger",
                                image: Images.burger,
                                price: "Rs.249",
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
                      ),
                    ],
                  ),
                ],
              ));
        },
        viewModelBuilder: () => RestaurantsProductsViewModel(),
        onModelReady: (model) => model.init(context, 10));
  }

  _categoryTile(
      {required int index,
      required int totalCount,
      required Function onTap,
      required int selectedIndex}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(
            (index == 0) ? 19 : 10, 0, (index == (totalCount - 1)) ? 20 : 0, 0),
        decoration: BoxDecoration(
            color: (index == selectedIndex)
                ? AppColors.primary
                : AppColors.darkGrey,
            borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.fromLTRB(12, 5, 15, 5),
        child: Center(
          child: Text(
            "Popular $index",
            style: TextStyling.normalText.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
