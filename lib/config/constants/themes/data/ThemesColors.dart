import 'package:flutter/material.dart';
import 'package:prueba_tecnica/config/constants/themes/data/CustomColors.dart';

class ThemesColors {

  static final light = CustomColors(
    textTitleColor: const Color(0xff232F3D),
    backgroundModalColor: const Color(0xffF1F1F1),
    backgroundButtonColor: const Color(0xff5086B2),
    textButtonColor: const Color(0xff5086B2),
  );

  static final dark = CustomColors(
    textTitleColor: const Color(0xffd6d6d4),
    backgroundModalColor: const Color(0xff242f3d),
    backgroundButtonColor: const Color.fromRGBO(255, 255, 255, 0.25),
    textButtonColor: const Color(0xff869199),
  );
}
