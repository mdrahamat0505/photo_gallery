import 'package:flutter/material.dart';

import '../utils/helpers/hex_color.dart';

class AppColors {
  const AppColors._();

  static const Color primaryColor = Color(0xffBAE162);
  static const Color darkBlue = Color(0xff1E2E3D);
  static const Color darkerBlue = Color(0xff152534);
  static const Color darkestBlue = Color(0xff0C1C2E);
  static Color appbarColor1 = hexToColor('#EEF0F6');
  static Color appbarColor = hexToColor('#444342');

  static const List<Color> defaultGradient = [
    darkBlue,
    darkerBlue,
    darkestBlue,
  ];
}
