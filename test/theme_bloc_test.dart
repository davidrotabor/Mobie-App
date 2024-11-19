import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_tecnica/config/constants/themes/presentation/theme_bloc.dart';
import 'package:prueba_tecnica/config/constants/themes/presentation/theme_event.dart';

void main() {
  group('ThemeBloc Tests', () {
    late ThemeBloc themeBloc;

    setUp(() {
      themeBloc = ThemeBloc();
    });

    test('Initial state is ThemeMode.light', () {
      expect(themeBloc.state, ThemeMode.light);
    });

    test('ThemeChanged toggles to ThemeMode.dark', () {
      themeBloc.add(ThemeChanged(true));
      expectLater(themeBloc.stream, emitsInOrder([ThemeMode.dark]));
    });

    test('ThemeChanged toggles back to ThemeMode.light', () {
      themeBloc.add(ThemeChanged(false));
      expectLater(themeBloc.stream, emitsInOrder([ThemeMode.light]));
    });
  });
}
