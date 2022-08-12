import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';

class ChefProductCart extends StatelessWidget {
  final Function onTap;

  const ChefProductCart({Key? key, required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        width: context.screenSize().width,
        height: 154,
        margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppColors.cardOrangeBackgroundShadow,
          color: Colors.white,
        ),
        child: Column(
          children:[
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
              child: Container(
                height: 104,
                width: context.screenSize().width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
                ),
                child: Image.asset(Images.foodImage,fit: BoxFit.cover,),
              ),
            ),
            VerticalSpacing(),
            Row(
              children: [
                HorizontalSpacing(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Zinger Burger",
                      style: TextStyling.h4,
                    ),
                    VerticalSpacing(5),
                    Text(
                      "Rs.250",
                      style: TextStyling.paragraphTheme.copyWith(color: AppColors.darkGrey),
                    ),

                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Image.asset(Images.star,height: 21,width: 24,),
                    HorizontalSpacing(),
                    Text(
                        "4.9",
                        style: TextStyling.normalText.copyWith(color: AppColors.darkGrey,fontSize: 16)
                    ),
                  ],
                ),
                HorizontalSpacing(15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
