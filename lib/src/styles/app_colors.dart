import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  AppColors._();

  static HexColor primary = HexColor("#FFA500");
  static HexColor secondary = HexColor("#FFD233");

  static HexColor darkGrey = HexColor("#CACACA");
  static HexColor lightGrey = HexColor("#E9E9E9");
  static HexColor black = HexColor("#4B4B4B");
  static HexColor white = HexColor("#ffffff");
  static HexColor red = HexColor("#FF0000");
  static HexColor blue = HexColor("#1346F9");

  static List<BoxShadow> cardGreyBackgroundShadow = [
    BoxShadow(
      color: Color(0x1e000000),
      blurRadius: 40,
      offset: Offset(-2, 15),
    ),
  ];

  static List<BoxShadow> cardOrangeBackgroundShadow = [
    BoxShadow(
      color: Color(0x3ffda400),
      blurRadius: 5,
      offset: Offset(-1, 1),
    ),
  ];
}
