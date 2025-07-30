import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: AppTheme.loadingCardDecoration,
            child: const CircularProgressIndicator(
              color: AppTheme.primary,
              strokeWidth: 3,
            ),
          ),
          const SizedBox(height: AppTheme.spacingL),
          const Text(
            "Carregando pergunta...",
            style: AppTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
} 