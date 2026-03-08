import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppLogo extends StatelessWidget {
  final double size;
  const AppLogo({super.key, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Text('🌸', style: TextStyle(fontSize: size * 0.7)),
      const SizedBox(width: 6),
      ShaderMask(
        shaderCallback: (bounds) => AppTheme.heroGradient.createShader(bounds),
        child: Text('Circlo', style: TextStyle(fontSize: size * 0.5, fontWeight: FontWeight.w900, color: Colors.white)),
      ),
    ]);
  }
}
