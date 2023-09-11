import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFECE0FD),
  100: Color(0xFFD0B3FA),
  200: Color(0xFFB180F7),
  300: Color(0xFF914DF3),
  400: Color(0xFF7A26F1),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF5A00EC),
  700: Color(0xFF5000E9),
  800: Color(0xFF4600E7),
  900: Color(0xFF3400E2),
});
const int _primaryPrimaryValue = 0xFF6200EE;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_primaryAccentValue),
  400: Color(0xFFB3A3FF),
  700: Color(0xFF9D8AFF),
});
const int _primaryAccentValue = 0xFFDDD6FF;
