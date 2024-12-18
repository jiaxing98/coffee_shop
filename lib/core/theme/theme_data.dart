import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static Map<String, ThemeData> get themes => {
        themeCoffee.key: themeCoffee.value,
      };

  static const String keyCoffee = "COFFEE";
  static MapEntry<String, ThemeData> get themeCoffee => MapEntry(
        keyCoffee,
        ThemeData(
          textTheme: GoogleFonts.soraTextTheme(),
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFFC67C4E),
            onPrimary: Color(0xFFEDD6C8),
            secondary: Color(0xFF313131),
            onSecondary: Color(0xFFE3E3E3),
            tertiary: Color(0xFFF9F2ED),
            error: Color(0xFFB3261E),
            onError: Color(0xFFFFFFFF),
            background: Color(0xFFF1F0E8),
            onBackground: Color(0xFF1C1B1F),
            surface: Color(0xFFF1F0E8),
            onSurface: Color(0xFF1C1B1F),
          ),
        ),
      );
}

// ! primary
// The main color used for prominent components.
// AppBar, FloatingActionButton

// ! onPrimary
// The color used for text/icons on top of the primary color.
// Text on AppBar

// ! secondary
// A secondary color used for accenting.
// FloatingActionButton, Chips

// ! onSecondary
// The color used for text/icons on top of the secondary color.
// Text on Chips

// ! background
// The background color for screens.
// Scaffold background

// ! onBackground
// The color for text/icons on top of the background color.
// Text on screens

// ! surface
// The background color for cards, dialogs, etc.
// Card background

// ! onSurface
// The color for text/icons on top of the surface color.
// Text inside Cards or Dialogs

// ! error
// The color used to indicate errors.
// Error messages

// ! onError
// The color for text/icons on top of the error color.
// Text in error Snackbar
