import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/models/product.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/app_screen.dart';
import 'package:net_chef/src/shared/buttons.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/shared/user/user_app_bar.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';
import 'package:net_chef/src/views/user_side/product_detail/product_detail_view_model.dart';
import 'package:stacked/stacked.dart';

class ProductDetailView extends StatelessWidget {
  final ProductModel productModel;
  final int count;

  const ProductDetailView({Key? key, required this.productModel, required this.count}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailViewModel>.reactive(
        builder: (context, model, child) {
          return AppScreen(
              isPrimary: false,
              child: Stack(
                children: [
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                    ),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        UserSecondaryAppBar(
                          isCart: false,
                          title: "",
                          cartCount: model.cartService.totalQuantity,
                          onProfileTap: () => NavService.userCart(),
                          onBackTap: () => Navigator.pop(context),
                        ),
                        Image.network(
                          productModel.pic ?? "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png",
                          height: 200,
                          width: 220,
                        ),
                        Container(
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: AppColors.cardOrangeBackgroundShadow),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    if (model.productSelectedCount > 0) {
                                      model.productSelectedCount--;
                                      model.notifyListeners();
                                    }
                                  },
                                  child: Image.asset(
                                    Images.minusVector,
                                    height: 30,
                                    width: 30,
                                  )),
                              HorizontalSpacing(),
                              Text(
                                model.productSelectedCount.toString(),
                                style: TextStyling.h2.copyWith(
                                    color: (model.productSelectedCount > 0)
                                        ? AppColors.primary
                                        : AppColors.darkGrey),
                              ),
                              HorizontalSpacing(),
                              InkWell(
                                  onTap: () {
                                    model.productSelectedCount++;
                                    model.notifyListeners();
                                  },
                                  child: Image.asset(
                                    Images.plusVector,
                                    height: 30,
                                    width: 30,
                                  )),
                            ],
                          ),
                        ),
                        VerticalSpacing(15),
                        Text(
                          productModel.pName ?? "",
                          style: TextStyling.h1,
                        ),
                        VerticalSpacing(15),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Rs.${productModel.pPrice}",
                                  style:
                                      TextStyling.h3.copyWith(color: AppColors.red),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: " Excluded Tax",
                                        style: TextStyling.normalText
                                            .copyWith(color: AppColors.darkGrey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(10),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Text(
                            productModel.pDes ?? "",
                            style: TextStyling.paragraphTheme.copyWith(color: AppColors.darkGrey,wordSpacing: 1.5,letterSpacing: 1.5),
                          ),
                        ),
                        VerticalSpacing(20),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            children: [
                              Text(
                                "Ingredients",
                                style: TextStyling.h3,
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(15),
                        SizedBox(
                          height: 50,
                          width: context.screenSize().width,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: productModel.ingrediantsModel?.length ?? 0,
                              itemBuilder: (itemBuilder, index) {
                                return _categoryTile(index: index, totalCount: productModel.ingrediantsModel?.length ?? 0, onTap: (){
                                  if(model.isSelected[index] == false){
                                    model.selectedIngrediants.add(productModel.ingrediantsModel?[index].name ?? "");
                                    print(model.selectedIngrediants);
                                  } else if(model.isSelected[index] == true) {
                                    model.selectedIngrediants.remove(productModel.ingrediantsModel?[index].name ?? "");
                                    print(model.selectedIngrediants);
                                  }
                                  model.isSelected[index] = !model.isSelected[index];
                                  model.notifyListeners();
                                }, isSelected: model.isSelected[index], ingrediantsModel: productModel.ingrediantsModel![index]);
                              }),
                        ),
                        VerticalSpacing(100)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                        child: MainButton(title: "Add to Bucket", onTap: (){
                          model.onAddInCart(context);
                        },
                          isBusy: model.isBusy,)),
                  ),
                ],
              ));
        },
        viewModelBuilder: () => ProductDetailViewModel(productModel),
        onModelReady: (model) => model.init(context,productModel.ingrediantsModel?.length ?? 0,count));
  }

  _categoryTile(
      {required int index,
      required int totalCount,
      required Function onTap,
        required IngrediantsModel ingrediantsModel,
      required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.fromLTRB(
            (index == 0) ? 19 : 10, 0, (index == (totalCount - 1)) ? 20 : 0, 0),
        decoration: BoxDecoration(
            color: (isSelected)
                ? AppColors.primary
                : AppColors.darkGrey,
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.fromLTRB(12, 5, 15, 5),
        child: Center(
          child: Text(
            ingrediantsModel.name ?? "",
            style: TextStyling.h4.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
