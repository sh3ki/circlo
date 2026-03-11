import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../theme/app_theme.dart';

class CircloAvatar extends StatelessWidget {
  final CircloUser user;
  final double size;

  const CircloAvatar({super.key, required this.user, this.size = 42});

  @override
  Widget build(BuildContext context) {
    final colorIdx = user.id.hashCode % AppTheme.storyColors.length;
    final color = AppTheme.storyColors[colorIdx.abs()];

    if (user.avatarUrl != null) {
      return ClipOval(
        child: Image.network(
          user.avatarUrl!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _fallback(color),
          loadingBuilder: (_, child, progress) {
            if (progress == null) return child;
            return _fallback(color);
          },
        ),
      );
    }
    return _fallback(color);
  }

  Widget _fallback(Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          user.avatar,
          style: TextStyle(
            color: color,
            fontSize: size * 0.32,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
