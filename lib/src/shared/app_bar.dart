import 'package:flutter/material.dart';
import 'package:net_chef/src/styles/app_colors.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar({Key? key})
      : super(preferredSize: Size.fromHeight(60), child: SizedBox.shrink());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20,top: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Icon(
              Icons.arrow_back,
              color: AppColors.primary,
                  size: 36,
            )),
          ),
        ],
      ),
    );
  }
}
