import 'package:flutter/material.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class CustomAppBarTheme {

  CustomAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 5,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: CustomColors.white,
    shadowColor: CustomColors.black,
    surfaceTintColor: CustomColors.white,
    iconTheme: IconThemeData(color: CustomColors.primary, size: 40),
    actionsIconTheme: IconThemeData(color: CustomColors.primary, size: 40),
    titleTextStyle: TextStyle(
        fontSize: 25.0, fontWeight: FontWeight.w600, color: CustomColors.textPrimary),
  ); // AppBarTheme

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: CustomColors.black,
    iconTheme: IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: CustomColors.textWhite),
  ); // AppBarTheme
}
