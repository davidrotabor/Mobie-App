import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  final bool isDark;

  ThemeChanged(this.isDark);
}