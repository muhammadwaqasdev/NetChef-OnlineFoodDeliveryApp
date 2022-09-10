import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';

class SearchInput extends StatefulWidget {
  final Function onTap;

  const SearchInput({Key? key, required this.onTap,}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {

  @override
  Widget build(BuildContext context) {

    return InkWell(
      child: Container(
        width: context.screenSize().width,
        height: 60,
        margin: EdgeInsets.only(left: 20,right: 20),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.lightGrey.withOpacity(0.5),
        ),
        child: Center(
          child: Row(
            children: [
              Image.asset(Images.search,height: 30,width: 30,),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.start,
                  onTap: (){
                    widget.onTap();
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Food or Restaurant Here",
                    hintStyle: TextStyling.paragraphTheme.copyWith(color: AppColors.darkGrey),
                    fillColor: AppColors.white,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20, 0, 24, 0),
                  ),
                  style: TextStyling.h2.copyWith(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
