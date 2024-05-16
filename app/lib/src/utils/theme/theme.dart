import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/theme/widget_themes/appBar_theme.dart';
import 'package:travel_link/src/utils/theme/widget_themes/bottomSheet_theme.dart';
import 'package:travel_link/src/utils/theme/widget_themes/checkBox_theme.dart';
import 'package:travel_link/src/utils/theme/widget_themes/chip_theme.dart';
import 'package:travel_link/src/utils/theme/widget_themes/elevatedButton_theme.dart';
import 'package:travel_link/src/utils/theme/widget_themes/outlinedButton_theme.dart';
import 'package:travel_link/src/utils/theme/widget_themes/textField_theme.dart';
import 'package:travel_link/src/utils/theme/widget_themes/floatingButton_theme.dart';
import 'package:travel_link/src/utils/theme/widget_themes/text_theme.dart';



//Theme.dart and other themeing files inspired by "https://www.youtube.com/watch?v=Ct9CrMegezQ"

class CustomAppTheme {
  CustomAppTheme._(); //privater Konstruktor

  /// Light Theme
  static ThemeData lightTheme = ThemeData(

    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.light,
    primaryColor: CustomColors.primary,
    scaffoldBackgroundColor: Colors.grey.shade100,
    textTheme: CustomTextTheme.lightTextTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme,
    floatingActionButtonTheme: CustomFloatingButtonTheme.lightFloatingButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.dark,
    primaryColor: CustomColors.primary,
    scaffoldBackgroundColor: CustomColors.black,
    textTheme: CustomTextTheme.darkTextTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.darkInputDecorationTheme, 
  );
}
