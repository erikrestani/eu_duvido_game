import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class AnimatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double? width;
  final double? height;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: width ?? double.infinity,
            height: height ?? 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withValues(alpha: 0.8)],
              ),
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              boxShadow: color == AppTheme.primary
                  ? AppTheme.primaryShadow
                  : AppTheme.secondaryShadow,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(AppTheme.radiusL),
                child: Center(
                  child: Text(
                    text,
                    style: AppTheme.labelLarge,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
} 