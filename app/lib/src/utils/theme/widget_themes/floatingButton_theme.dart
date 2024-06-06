import 'package:flutter/material.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

/// Floating Button Theme
class CustomFloatingButtonTheme {
  CustomFloatingButtonTheme._();

  /// Light Theme
  static final lightFloatingButtonTheme = const FloatingActionButtonThemeData(
    elevation: 8, // Adjust the elevation as needed
    foregroundColor: CustomColors.white,
    backgroundColor: CustomColors.primary,

    shape: CircleBorder(), // Circular shape for floating button
  );
}
