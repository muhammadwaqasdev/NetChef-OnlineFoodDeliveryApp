import 'package:flutter/material.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';

class multiSelectionField extends StatefulWidget {
  multiSelectionField({
    Key? key,
    required this.onChanged,
    required this.values,
    required this.name,
    this.errorMessage = "Required",
  }) : super(key: key);

  ValueChanged<List> onChanged;
  List<String> values;
  TextEditingController name;
  String errorMessage;

  @override
  State<multiSelectionField> createState() => _multiSelectionFieldState();
}

class _multiSelectionFieldState extends State<multiSelectionField> {
  @override
  Widget build(BuildContext context) {
    List valueData = widget.values;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGrey),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Ingredients Names",
        hintStyle: TextStyling.paragraphTheme.copyWith(color: AppColors.darkGrey),),
            controller: widget.name,
            style: TextStyling.normalText.copyWith(color: AppColors.black),
            onSubmitted: (value) {
              if (value != "") {
                valueData.add(value);
                widget.onChanged(valueData);
              }
            },
          ),
          MyChipList(
              values: widget.values,
              chipBuilder: (String value) {
                return Chip(
                  backgroundColor: AppColors.black.withOpacity(0.6),
                  label: Text(
                    value,
                    style:
                    TextStyling.normalText.copyWith(color: AppColors.white),
                  ),
                  deleteIconColor: AppColors.white,
                  onDeleted: () {
                    widget.values.remove(value);
                  },
                );
              })
        ],
      ),
    );
  }
}


class MyChipList<T> extends StatelessWidget {
  const MyChipList({
    required this.values,
    required this.chipBuilder,
  });

  final List<T> values;
  final Chip Function(T) chipBuilder;

  List<Widget> _buildChipList() {
    final List<Widget> items = [];
    for (T value in values) {
      items.add(chipBuilder(value));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChipList(),
    );
  }
}
