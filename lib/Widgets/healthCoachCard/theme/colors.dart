import 'package:flutter/material.dart';

class CareNavigationColors {
  CareNavigationColors._();

  // color palette, these should rarely ever change
  static const tpBrightBlue = Color(0xFF208CFF);
  static const tpMidBlue = Color(0xFF0052B1);
  static const tpBlue = Color(0xFF002254);
  static const tpDarkBlue = Color(0xFF232A3F);
  static const tpAccentYellow = Color(0xFFFFCE44);
  static const tpDigitalGreen = Color(0xFF17C859);
  static const brightGreen = Color(0xFF4DEA8A);
  static const brightRed = Color(0xFFFA2958);
  static const darkRed = Color(0xFFD01D45);
  static const white = Color(0xFFFFFFFF);
  static const grayAccent = Color(0xFFDEDEDE);
  static const gray = Color(0xFF979797);
  static const mostlyTransparentBlack = Color(0x3D000000); // 25%

  // usage based colors.
  // Most new re-usable colors styles should go here and reference the colors above.
  // This solves the actual reason for having styles, that you can safely change them
  // One-off colors can be hardcoded in the widgets to not pollute this file
  static const boxShadowColor = mostlyTransparentBlack;
  static const overlayColor = tpBlue;
}
