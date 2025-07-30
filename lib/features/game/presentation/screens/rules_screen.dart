import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/animated_button.dart';
import '../bloc/question_bloc.dart';
import '../bloc/question_event.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({super.key});

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  int _currentStep = 0;

  final List<Map<String, dynamic>> _rules = [
    {
      'icon': Icons.question_mark,
      'title': 'Perguntas de Quantidade',
      'description': 'O jogo apresenta perguntas sobre quantidades, como "Quantas pessoas cabem em um estádio?"',
      'color': AppTheme.primary,
    },
    {
      'icon': Icons.people,
      'title': 'Jogadores em Ordem',
      'description': 'Os jogadores fazem suas estimativas em ordem, um por vez',
      'color': AppTheme.secondary,
    },
    {
      'icon': Icons.gps_fixed,
      'title': 'Sistema de Vidas',
      'description': 'Cada jogador começa com 5 vidas. Cuide bem delas!',
      'color': AppTheme.primary,
    },
    {
      'icon': Icons.warning,
      'title': 'Perder Vidas',
      'description': 'Você perde uma vida quando duvida incorretamente ou quando alguém duvida de você',
      'color': AppTheme.secondary,
    },
    {
      'icon': Icons.favorite,
      'title': 'Recuperar Vida',
      'description': 'Recupere uma vida quando der uma resposta exata!',
      'color': AppTheme.primary,
    },
    {
      'icon': Icons.sports_esports,
      'title': 'Como Duvidar',
      'description': 'Diga "Eu duvido!" quando achar que alguém está muito errado',
      'color': AppTheme.secondary,
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < _rules.length - 1) {
      setState(() {
        _currentStep++;
      });
      _animationController.reset();
      _animationController.forward();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentRule = _rules[_currentStep];

    return Scaffold(
      appBar: AppBar(
        title: const Text("📖 Regras do Jogo"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingL),
          child: Column(
            children: [
              // Progress indicator
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingM),
                decoration: AppTheme.cardDecoration,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Passo ${_currentStep + 1} de ${_rules.length}",
                          style: AppTheme.labelMedium,
                        ),
                        Text(
                          "${((_currentStep + 1) / _rules.length * 100).round()}%",
                          style: AppTheme.labelMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.spacingS),
                    LinearProgressIndicator(
                      value: (_currentStep + 1) / _rules.length,
                      backgroundColor: AppTheme.textPrimary.withValues(alpha: 0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(currentRule['color']),
                      minHeight: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppTheme.spacingL),

              // Rule content
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.spacingXL),
                      decoration: AppTheme.cardDecoration,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon
                          Container(
                            padding: const EdgeInsets.all(AppTheme.spacingL),
                            decoration: BoxDecoration(
                              color: currentRule['color'].withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(AppTheme.radiusXL),
                              border: Border.all(color: currentRule['color']),
                            ),
                            child: Icon(
                              currentRule['icon'],
                              size: 60,
                              color: currentRule['color'],
                            ),
                          ),
                          const SizedBox(height: AppTheme.spacingXXL),

                          // Title
                          Text(
                            currentRule['title'],
                            textAlign: TextAlign.center,
                            style: AppTheme.headlineMedium,
                          ),
                          const SizedBox(height: AppTheme.spacingL),

                          // Description
                          Text(
                            currentRule['description'],
                            textAlign: TextAlign.center,
                            style: AppTheme.bodyLarge.copyWith(height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.spacingL),

              // Navigation buttons
              Row(
                children: [
                  if (_currentStep > 0) ...[
                    Expanded(
                      child: AnimatedButton(
                        text: "⬅️ Anterior",
                        onPressed: _previousStep,
                        color: AppTheme.secondary,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                  ],
                  Expanded(
                    flex: _currentStep > 0 ? 1 : 1,
                    child: AnimatedButton(
                      text: _currentStep == _rules.length - 1
                          ? "🎮 COMEÇAR JOGO"
                          : "Próximo ➡️",
                      onPressed: _currentStep == _rules.length - 1
                          ? () {
                              context.read<QuestionBloc>().add(FetchQuestionEvent());
                              Navigator.of(context).pop();
                            }
                          : _nextStep,
                      color: currentRule['color'],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 