import 'package:bmi/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(

        headlineLarge: GoogleFonts.inter(
            fontSize: 50, fontWeight: FontWeight.w700, color: headlineColor),
        bodyMedium: GoogleFonts.inter(
            fontSize: 18, fontWeight: FontWeight.w500, color: bodyColor),
        bodySmall: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.w500, color: bodyColor),
        titleLarge: GoogleFonts.inter(
            fontSize: 22, fontWeight: FontWeight.w700, color: titleMediumColor),
        titleMedium: GoogleFonts.inter(
            fontSize: 20, fontWeight: FontWeight.w500, color: titleMediumColor),
      ),
      sliderTheme: const SliderThemeData(
        inactiveTrackColor: onSurfaceColor, // this for deslect line
        trackHeight: 2,
      ),
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(
                  GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.w700)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))))),
      iconTheme: const IconThemeData(color: Colors.white, size: 20),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: onPrimaryColor,
          secondary: secondaryColor,
          onSecondary: onSecondaryColor,
          error: errorColor,
          onError: onErrorColor,
          background: backgroundColor,
          onBackground: onBackgroundColor,
          surface: surfaceColor,
          surfaceTint: surfaceColor,
          onSurfaceVariant: onSurfaceColor,
          onSurface: onSurfaceColor));
}
