import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleWidget {
  static TextStyle header1({Color? color}) {
    return GoogleFonts.poppins(
        fontSize: 37, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle appBarTitle({Color? color}) {
    return GoogleFonts.poppins(
        fontSize: 18, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle header2({Color? color}) {
    return GoogleFonts.poppins(
        fontSize: 28, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle body({Color? color}) {
    return GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.normal, color: color);
  }

  static TextStyle label({Color? color}) {
    return GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color ?? const Color(0xFF868686));
  }
}
