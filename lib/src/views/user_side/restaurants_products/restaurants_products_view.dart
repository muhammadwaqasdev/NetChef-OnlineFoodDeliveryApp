import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/configs/app_setup.router.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/app_screen.dart';
import 'package:net_chef/src/shared/loading_indicator.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/shared/user/product_tile.dart';
import 'package:net_chef/src/shared/user/user_app_bar.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';
import 'package:net_chef/src/views/user_side/restaurants_products/restaurants_products_view_model.dart';
import 'package:stacked/stacked.dart';

class RestaurantsProductsView extends StatelessWidget {
  final ChefUser chefId;

  const RestaurantsProductsView({Key? key, required this.chefId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RestaurantsProductsViewModel>.reactive(
        builder: (context, model, child) {
          return (model.isBusy) ?
          Center(child: LoadingIndicator(color: AppColors.primary,)) : AppScreen(
            isHereFloatButton: true,
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
                        title: "",
                        cartCount: model.cartService.totalQuantity,
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
                                    chefId.businessIcon ?? "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
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
                                  chefId.businessName ?? "",
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
                              "All Products",
                              style: TextStyling.h3
                                  .copyWith(color: AppColors.darkGrey),
                            ),
                          ],
                        ),
                      ),
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
                                image: model.productModel[index].pic ?? "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png",
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
                                  NavService.productDetail(arguments: ProductDetailViewArguments(productModel: model.productModel[index], count: model.productSelectedCount[index]));
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ));
        },
        viewModelBuilder: () => RestaurantsProductsViewModel(chefId: chefId),
        onModelReady: (model) => model.init(context, model.productModel.length));
  }
}
