import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    canvasColor: Colors.white,
    primaryColor: const Color(0xFF86337c),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Avenir',
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(color: Colors.white),
      padding: EdgeInsets.zero,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    )),
    textTheme: TextTheme(
      headline1: GoogleFonts.openSans(
          textStyle: TextStyle(fontSize: 4.5.sp, fontWeight: FontWeight.w500, color: Colors.black)),
      headline2: GoogleFonts.openSans(
          textStyle: TextStyle(fontSize: 4.5.sp, fontWeight: FontWeight.w500, color: Colors.black)),
      headline3: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xff163567)),
      bodyText1:
          GoogleFonts.openSans(textStyle: TextStyle(fontSize: 4.sp, fontWeight: FontWeight.w500, color: Colors.black)),
      bodyText2: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Color(0xff163567)),
      subtitle1: GoogleFonts.openSans(
          textStyle: TextStyle(fontSize: 3.7.sp, fontWeight: FontWeight.w500, color: Colors.black)),
      subtitle2: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Color(0xff163567)),
      button: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xff163567)),
      caption: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Color(0xff163567)),
    ),
  );
}
