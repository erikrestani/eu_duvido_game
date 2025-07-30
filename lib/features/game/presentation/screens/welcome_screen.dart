import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/animated_button.dart';
import 'rules_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingXXL),
            decoration: AppTheme.cardDecoration,
            child: const Icon(
              Icons.quiz,
              size: 80,
              color: AppTheme.primary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingXXL),
          const Text(
            "Bem-vindo ao\nEu Duvido!",
            textAlign: TextAlign.center,
            style: AppTheme.headlineLarge,
          ),
          const SizedBox(height: AppTheme.spacingL),
          const Text(
            "Desafie seus amigos com perguntas de quantidade!",
            textAlign: TextAlign.center,
            style: AppTheme.bodyMedium,
          ),
          const SizedBox(height: AppTheme.spacingXXXL),
          AnimatedButton(
            text: "🎮 COMEÇAR JOGO",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RulesScreen(),
                ),
              );
            },
            color: AppTheme.primary,
          ),
        ],
      ),
    );
  }
} 