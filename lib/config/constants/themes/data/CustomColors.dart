import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color? textTitleColor;
  final Color? backgroundModalColor;
  final Color? backgroundButtonColor;
  final Color? textButtonColor;

  CustomColors({
    this.textTitleColor,
    this.backgroundModalColor,
    this.backgroundButtonColor,
    this.textButtonColor,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? textTitleColor,
    Color? backgroundModalColor,
    Color? backgroundButtonColor,
    Color? textButtonColor,
  }) {
    return CustomColors(
      textTitleColor: textTitleColor ?? this.textTitleColor,
      backgroundModalColor: backgroundModalColor ?? this.backgroundModalColor,
      backgroundButtonColor:
          backgroundButtonColor ?? this.backgroundButtonColor,
      textButtonColor: textButtonColor ?? this.textButtonColor,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      covariant ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      textTitleColor: Color.lerp(textTitleColor, other.textTitleColor, t),
      backgroundModalColor:
          Color.lerp(backgroundModalColor, other.backgroundModalColor, t),
      backgroundButtonColor:
          Color.lerp(backgroundButtonColor, other.backgroundButtonColor, t),
      textButtonColor: Color.lerp(textButtonColor, other.textButtonColor, t),
    );
  }
}
