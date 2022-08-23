import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/services/remote/base/firebase_view_model.dart';
import 'package:net_chef/src/services/remote/firebase_service.dart';
import 'package:net_chef/src/shared/ink_touch.dart';
import 'package:net_chef/src/styles/app_colors.dart';

class ChefDrawer extends StatelessWidget {
  final GestureTapCallback? onDrawerCloseTap;
  final bool isGoalSetup;
  final ChefUser? user;

  const ChefDrawer({this.onDrawerCloseTap, this.isGoalSetup = false, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: (MediaQuery.of(context).padding.top + 12)),
      color: AppColors.primary,
      height: context.screenSize().height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
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
                user?.businessIcon ?? "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              _iconControl(context,
                  icon: Images.homeWhiteVector, size: Size(30, 30), onTap: () {
                NavService.chefDashboard();
              }),
              _iconControl(context,
                  icon: Images.orderVector,
                  size: Size(30, 30),
                  onTap: () {
                  NavService.chefOrders();
                  }),
              _iconControl(context,
                  icon: Images.productVector,
                  size: Size(30, 30),
                  onTap: () {
                NavService.chefProducts();
                  }),
            ],
          ),
          _iconControl(context, icon: Images.logoutVector, size: Size(30, 30),
              onTap: () async{
                FirebaseService firebase = FirebaseService();
                bool isDone = await firebase.signOutChefUser();
                if(isDone){
                  NavService.login();
                }
          }),
        ],
      ),
    );
  }

  Widget _iconControl(BuildContext context,
          {GestureTapCallback? onTap,
          required String icon,
          required Size size}) =>
      InkTouch(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          onTap: onTap,
          child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.screenSize().height < 600 ? 10 : 20),
              width: 100,
              child: Image.asset(
                icon,
                width: size.width,
                height: size.height,
                color: Colors.white,
              )));
}
