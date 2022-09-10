import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/src/configs/app_setup.router.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/user/product_tile.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';
import 'package:net_chef/src/views/user_side/user_dashboard/HomeSearch/home_search_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeSearchView extends SearchDelegate<String?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ViewModelBuilder<HomeSearchViewModel>.reactive(
      builder: (context, model, child) => (model.isBusy)
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            )
          : (model.productModel.length > 0)
              ? GridView.builder(
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
      )
              : Center(
                  child: Text(
                  "No Match Found",
                  style: TextStyling.normalText,
                )),
      viewModelBuilder: () => HomeSearchViewModel(),
      onModelReady: (model) => model.init(query, context),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(
        'No Result\nSearch Now',
        textAlign: TextAlign.center,
      ),
    );
  }
}
