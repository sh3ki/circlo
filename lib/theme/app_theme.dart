import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Circlo — Warm Social Palette
  static const Color primary = Color(0xFFFF6B6B);
  static const Color primaryDark = Color(0xFFE85555);
  static const Color secondary = Color(0xFF1A1A2E);
  static const Color accent = Color(0xFF4ECDC4);
  static const Color surface = Color(0xFFFFF8F0);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color divider = Color(0xFFF0EDE8);
  static const Color warning = Color(0xFFFFB84D);
  static const Color success = Color(0xFF51CF66);

  static const List<Color> storyColors = [
    Color(0xFFFF6B6B),
    Color(0xFF4ECDC4),
    Color(0xFFFFB84D),
    Color(0xFF845EC2),
    Color(0xFFFF9671),
    Color(0xFF00C9A7),
    Color(0xFFFFC75F),
    Color(0xFFD65DB1),
  ];

  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: const Color(0xFF1A1A2E).withOpacity(0.04),
      blurRadius: 12,
      offset: const Offset(0, 2),
    ),
  ];

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
        primary: primary,
        secondary: secondary,
        surface: surface,
      ),
      scaffoldBackgroundColor: surface,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: textPrimary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
    );
  }
}
