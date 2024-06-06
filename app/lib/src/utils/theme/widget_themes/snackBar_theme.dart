import 'package:flutter/material.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class CustomSnackBarTheme {
  CustomSnackBarTheme._();

  static final lightSnackBarTheme = SnackBarThemeData(
    backgroundColor: CustomColors.primary.withOpacity(0.7),
    contentTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );

  static final darkSnackBarTheme = SnackBarThemeData(
    backgroundColor: CustomColors.primary.withOpacity(0.7),
    contentTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );
}
