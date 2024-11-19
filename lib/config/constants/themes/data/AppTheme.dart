import 'package:flutter/material.dart';
import 'package:prueba_tecnica/config/constants/themes/data/CustomColors.dart';
import 'package:prueba_tecnica/config/constants/themes/data/ThemesColors.dart';


class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      extensions: <ThemeExtension<CustomColors>>{ThemesColors.light});

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      extensions: <ThemeExtension<CustomColors>>{ThemesColors.dark});
}
