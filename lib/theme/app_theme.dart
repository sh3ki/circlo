import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primary = Color(0xFFEC4899);
  static const Color secondary = Color(0xFF7C3AED);
  static const Color accent = Color(0xFFF59E0B);
  static const Color surface = Color(0xFFFFF0F6);

  static LinearGradient get heroGradient => const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFEC4899), Color(0xFF7C3AED)],
  );

  static LinearGradient get storyGradient => const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF97316), Color(0xFFEC4899), Color(0xFF7C3AED)],
  );

  static List<BoxShadow> get cardShadow => [
    BoxShadow(color: primary.withOpacity(0.12), blurRadius: 16, offset: const Offset(0, 4)),
  ];

  static List<BoxShadow> get softShadow => [
    BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 2)),
  ];

  static ThemeData get lightTheme {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: primary, surface: surface),
    );
    return base.copyWith(
      scaffoldBackgroundColor: surface,
      textTheme: base.textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: primary.withOpacity(0.12),
        labelTextStyle: WidgetStateProperty.all(TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
