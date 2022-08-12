import 'package:flutter/material.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';

class CustomInput extends StatefulWidget {
  final bool isPassword;
  final bool? isUseForDialog;
  final String label, hint;
  final TextEditingController controller;
  final Function onTap;
  final TextInputType? inputType;
  final ValueChanged<String> onChanged;
  final bool isRequired;
  final String errorMessage;

  const CustomInput(
      {Key? key,
      required this.isPassword,
      required this.label,
      required this.controller,
      required this.onTap,
      this.isUseForDialog,
      required this.hint,
      this.inputType,
      this.isRequired = true,
      required this.onChanged,
      this.errorMessage = "Required"})
      : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {

  bool valNew = false;
  bool emailValid = true;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: context.screenSize().width,
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: (valNew == true || (emailValid == false)) ? Border.all(
          color: AppColors.red,
          width: 1,
        ) : Border.all(
          color: AppColors.darkGrey,
          width: 1,
        ),
        color: AppColors.white,
      ),
      child: TextFormField(
        onTap: () {
          widget.onTap();
        },
        textInputAction: TextInputAction.next,
        readOnly: widget.isUseForDialog ?? false,
        validator: (val) {
          if (widget.inputType == TextInputType.emailAddress) {
            emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(widget.controller.text);
          }
          valNew = val!.isEmpty;
          this.setState(() {
          });
          return widget.isRequired
              ? (val.isEmpty || (emailValid == false))
                  ? widget.errorMessage
                  : null
              : null;
        },
        onChanged: (val) {
          widget.onChanged(val);
        },
        keyboardType: widget.inputType ?? TextInputType.text,
        controller: widget.controller,
        obscureText: widget.isPassword,
        // minLines: 1,
        // maxLines: (widget.inputType == TextInputType.multiline) ? 10 : 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hint,
          hintStyle: TextStyling.paragraphTheme.copyWith(color: AppColors.darkGrey),
          fillColor: AppColors.white,
          contentPadding:
              const EdgeInsetsDirectional.fromSTEB(20, 0, 24, 0),
        ),
        style: TextStyling.h2.copyWith(fontSize: 15),
      ),
    );
  }
}
