import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  const AppThemeData();
  static ThemeData lightTheme() => ThemeData(
        fontFamily: GoogleFonts.nunito.toString(),
        scaffoldBackgroundColor: Colors.white,
        primaryIconTheme:
            const IconThemeData(color: Color.fromARGB(255, 56, 83, 120)),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff3d5a80),
          ),
        ),
        primaryColorDark: const Color.fromARGB(255, 15, 47, 88),
        primaryColorLight: const Color.fromARGB(255, 12, 142, 202),
        colorScheme: const ColorScheme.light(
          secondary: Color(0xff3d5a80),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 60, 91, 148),
        ),
        textTheme: GoogleFonts.nunitoTextTheme().copyWith(
            titleLarge: const TextStyle(color: Color(0xff3d5a80), fontSize: 28),
            titleMedium:
                const TextStyle(color: Color(0xff3d5a80), fontSize: 28),
            bodyMedium: const TextStyle(color: Colors.white, fontSize: 28),
            bodySmall: const TextStyle(color: Colors.white, fontSize: 16),
            titleSmall:
                const TextStyle(color: Color(0xff3d5a80), fontSize: 20)),
      );

  static ThemeData darkTheme() => ThemeData(
        fontFamily: GoogleFonts.nunito.toString(),
        scaffoldBackgroundColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color.fromARGB(255, 172, 207, 255),
            unselectedItemColor: Color.fromARGB(255, 110, 123, 130)),
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        primaryColorLight: const Color.fromARGB(255, 24, 107, 145),
        primaryColorDark: const Color.fromARGB(255, 255, 255, 255),
        colorScheme: const ColorScheme.dark(
          secondary: Color.fromARGB(255, 172, 207, 255),
          tertiary: Colors.deepPurpleAccent,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: GoogleFonts.nunitoTextTheme().copyWith(
            titleLarge: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 28),
            titleMedium: const TextStyle(
                color: Color.fromARGB(255, 147, 144, 144), fontSize: 28),
            bodyMedium: const TextStyle(color: Colors.white, fontSize: 28),
            titleSmall: const TextStyle(
                color: Color.fromARGB(255, 185, 182, 182), fontSize: 20)),
      );
}
