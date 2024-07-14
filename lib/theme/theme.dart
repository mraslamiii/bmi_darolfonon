import 'package:bmi/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        titleMedium: GoogleFonts.inter(
            fontSize: 20, fontWeight: FontWeight.w500, color: titleMediumColor),
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
