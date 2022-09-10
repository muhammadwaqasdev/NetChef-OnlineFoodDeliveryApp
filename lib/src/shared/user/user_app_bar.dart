import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/configs/app_setup.locator.dart';
import 'package:net_chef/src/models/user.dart';
import 'package:net_chef/src/services/local/auth_service.dart';
import 'package:net_chef/src/services/local/base/cart_service_view_model.dart';
import 'package:net_chef/src/services/local/cart_service.dart';
import 'package:net_chef/src/shared/drawer_container.dart';
import 'package:net_chef/src/shared/load_image.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';

class UserPrimaryAppBar extends PreferredSize {
  final GestureTapCallback? onDrawerIconTap;
  final GestureTapCallback? onGoCartTap;
  final CustomerUser? user;

  const UserPrimaryAppBar({
    this.user,
    this.onGoCartTap,
    this.onDrawerIconTap,
  }) : super(
            child: const SizedBox.shrink(),
            preferredSize: const Size.fromHeight(90));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 12,left: 20,right: 20,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onDrawerIconTap,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightGrey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12)
              ),
              height: 48,
              width: 48,
              child: Center(
                child: Image.asset(
                  Images.menuOragneVector,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Image.asset(
                  Images.location,
                  height: 36,
                ),
                Text(user?.address ?? "",style: TextStyling.normalText.copyWith(color: AppColors.darkGrey),),
              ],
            ),
          ),
          GestureDetector(
              onTap: onGoCartTap,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.lightGrey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12)
                ),
                height: 48,
                width: 48,
                child: Center(
                  child: Image.asset(
                    Images.cartVector,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class UserSecondaryAppBar extends PreferredSize {
  final GestureTapCallback? onBackTap;
  final GestureTapCallback? onProfileTap;
  final bool? isCart;
  final String? title;
  final int? cartCount;

  const UserSecondaryAppBar({
    required this.onBackTap,
    required this.onProfileTap,
    required this.isCart,
    this.title = "",
    this.cartCount = 0
  }) : super(
      child: const SizedBox.shrink(),
      preferredSize: const Size.fromHeight(90));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 12,left: 20,right: 20,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onBackTap,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(12)
              ),
              height: 48,
              width: 48,
              child: Center(
                child: Image.asset(
                  Images.arrow,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
          if(title != "")Text(
            title!,
            style: TextStyling.h2
                .copyWith(color: AppColors.primary),
          ),
          (isCart == false) ? GestureDetector(
            onTap: onProfileTap,
            child: Badge(
              badgeContent: Text(cartCount.toString()),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(12)
                ),
                height: 48,
                width: 48,
                child: Center(
                  child: Image.asset(
                    Images.cartVector,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ) : GestureDetector(
            onTap: onProfileTap,
            child: Container(
              height: 48,
              width: 48,
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
        ],
      ),
    );
  }
}
