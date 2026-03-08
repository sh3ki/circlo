import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const CircloApp());
}

class CircloApp extends StatelessWidget {
  const CircloApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circlo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
