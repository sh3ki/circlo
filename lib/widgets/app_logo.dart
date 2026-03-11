import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool light;

  const AppLogo({super.key, this.size = 40, this.light = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(size * 0.28),
          child: Image.asset(
            'assets/images/circlo logo.png',
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: size * 0.2),
        Text(
          'circlo',
          style: TextStyle(
            fontSize: size * 0.5,
            fontWeight: FontWeight.w800,
            color: light ? Colors.white : AppTheme.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
}
