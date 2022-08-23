import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/shared/app_screen.dart';
import 'package:net_chef/src/shared/buttons.dart';
import 'package:net_chef/src/shared/chef/chef_app_bar.dart';
import 'package:net_chef/src/shared/input_field.dart';
import 'package:net_chef/src/shared/load_image.dart';
import 'package:net_chef/src/shared/loading_indicator.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';
import 'package:net_chef/src/views/chef_side/chef_add_products/chef_add_products_view_model.dart';
import 'package:stacked/stacked.dart';

class ChefAddProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext cont) {
    return ViewModelBuilder<ChefAddProductsViewModel>.reactive(
        builder: (cont, model, child) {
          return AppScreen(
              appBar: ChefPrimaryAppBar(
                onDrawerIconTap: () => Navigator.pop(cont),
                onSyncTap: () => (){},
                icon: Images.arrow,
                isSyncShow: false,
                isProductPage: false,
                user: model.currentUser,
              ),
              child:(model.isBusy == false) ? Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Form(
                  child: Builder(
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  LoadImage(model.productPicture,
                                    size: Size(110, 110),
                                    isCircle: true,
                                    pickedImage: model.uploadImage,
                                    isUploadLoader: model.isBusy,
                                    hasPickOption: true,
                                  ),
                                  VerticalSpacing(),
                                  CustomInput(
                                    isPassword: false,
                                    label: "Product Name",
                                    inputType: TextInputType.text,
                                    controller: model.productName,
                                    onTap: () {},
                                    hint: "Enter Product Name",
                                    onChanged: (String value) {  },),
                                  CustomInput(
                                    isPassword: false,
                                    label: "Price",
                                    inputType: TextInputType.multiline,
                                    controller: model.productPrice,
                                    onTap: () {},
                                    hint: "Enter Product Price", onChanged: (String value) {  },),
                                  CustomInput(
                                    isPassword: false,
                                    label: "Categories",
                                    isUseForDialog: true,
                                    controller: model.productCat,
                                    onTap: () async{
                                      await model.getCategory(context, model.currentUser.id ?? "");

                                      model.productCat.text = (await showDialog<String>(
                                        context: context,
                                        builder: (ctx) => Material(
                                          type: MaterialType.transparency,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(30, 60, 30, 60),
                                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius: BorderRadius.circular(15),
                                              boxShadow: AppColors.cardGreyBackgroundShadow,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Categories",style: TextStyling.h4.copyWith(color: AppColors.primary),),
                                                    InkWell(
                                                      onTap: (){
                                                        Navigator.pop(ctx,"");
                                                      },
                                                        child: Icon(Icons.cancel_outlined,color: AppColors.primary,size: 24,))
                                                  ],
                                                ),
                                                VerticalSpacing(10),
                                                CustomInput(
                                                  isPassword: false,
                                                  label: "Category Name",
                                                  inputType: TextInputType.text,
                                                  controller: model.categoryName,
                                                  onTap: () {},
                                                  hint: "Enter Category Name",
                                                  onChanged: (String value) {  },),
                                                MainButton(
                                                  title: "Add New Category",
                                                  onTap: () {
                                                    if(model.categoryName.text != ""){
                                                      model.addCategory(context, model.currentUser.id ?? "", model.categoryName.text);
                                                      model.productCat.text = model.categoryName.text;
                                                      model.categoryName.clear();
                                                      Navigator.pop(ctx,model.productCat.text);
                                                    }
                                                  },
                                                  isBusy: model.isBusy,
                                                ),
                                                SizedBox(
                                                  height: context.screenSize().height - 350,
                                                  child: ListView.builder(
                                                      physics: BouncingScrollPhysics(),
                                                      itemCount: model.categoryModel.length,
                                                      itemBuilder: (context, index) {
                                                        return InkWell(
                                                          onTap: (){
                                                            Navigator.pop(context, model.categoryModel[index].pName);
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: AppColors.white,
                                                              boxShadow: AppColors.cardOrangeBackgroundShadow,
                                                              borderRadius: BorderRadius.circular(5),
                                                            ),
                                                            padding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
                                                            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                                            child: Text(model.categoryModel[index].pName ?? "",style: TextStyling.h3,),
                                                          ),
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))!;
                                    },
                                    hint: "Select Product Categories", onChanged: (String value) {  },),
                                  CustomInput(
                                    isPassword: false,
                                    label: "Description",
                                    inputType: TextInputType.multiline,
                                    controller: model.productDes,
                                    onTap: () {},
                                    hint: "Enter Product Description", onChanged: (String value) {  },),
                                ],
                              ),
                              VerticalSpacing(30),
                              MainButton(
                                title: "Create",
                                onTap: () {
                                  model.checkValidate(context, cont);
                                },
                                isBusy: model.isBusy,
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                ),
              ) : Center(child: LoadingIndicator(color: AppColors.primary,size: 48,),));
        },
        viewModelBuilder: () => ChefAddProductsViewModel(),
        onModelReady: (model) => model.init(cont));
  }
}
