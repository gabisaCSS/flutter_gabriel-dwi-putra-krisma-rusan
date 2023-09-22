import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleTheme {
  // display
  TextStyle m3DisplayLarge({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black);
  }

  TextStyle m3DisplayMedium({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black);
  }

  TextStyle m3DisplaySmall({Color? color}) {
    return GoogleFonts.roboto(fontSize: 36, fontWeight: FontWeight.w400);
  }

  // headline
  TextStyle m3HeadlineLarge({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black);
  }

  TextStyle m3HeadlineMedium({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black);
  }

  TextStyle m3HeadlineSmall({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black);
  }

  // title
  TextStyle m3TitleLarge({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black);
  }

  TextStyle m3TitleMedium({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  TextStyle m3TitleSmall({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  // label
  TextStyle m3LabelLarge({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  TextStyle m3LabelMedium({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  TextStyle m3LabelSmall({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  // body
  TextStyle m3BodyLarge({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  TextStyle m3BodyMedium({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  TextStyle m3BodySmall({Color? color}) {
    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }
}
