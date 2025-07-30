import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/animated_button.dart';
import '../bloc/question_bloc.dart';
import '../bloc/question_event.dart';
import '../bloc/question_state.dart';

class QuestionScreen extends StatelessWidget {
  final QuestionLoaded state;

  const QuestionScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingXS,
          ),
          decoration: AppTheme.primaryCardDecoration,
          child: Text(
            "Pergunta #${state.questionCount}",
            style: AppTheme.labelSmall,
          ),
        ),
        const SizedBox(height: AppTheme.spacingL),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppTheme.spacingXL),
            decoration: AppTheme.cardDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.question_mark,
                  size: 50,
                  color: AppTheme.primary,
                ),
                const SizedBox(height: AppTheme.spacingL),
                Text(
                  state.question.question,
                  textAlign: TextAlign.center,
                  style: AppTheme.titleLarge.copyWith(height: 1.4),
                ),
                const SizedBox(height: AppTheme.spacingXXL),
                if (!state.showAnswer) ...[
                  AnimatedButton(
                    text: "🤔 EU DUVIDO!",
                    onPressed: () => context.read<QuestionBloc>().add(ShowAnswerEvent()),
                    color: AppTheme.primary,
                  ),
                ] else ...[
                  Container(
                    padding: const EdgeInsets.all(AppTheme.spacingL),
                    decoration: AppTheme.primaryCardDecoration,
                    child: Column(
                      children: [
                        const Text(
                          "🎯 RESPOSTA:",
                          style: AppTheme.labelMedium,
                        ),
                        const SizedBox(height: AppTheme.spacingS),
                        Text(
                          state.question.answer,
                          textAlign: TextAlign.center,
                          style: AppTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: AppTheme.spacingL),
        AnimatedButton(
          text: "🔄 NOVA PERGUNTA",
          onPressed: () => context.read<QuestionBloc>().add(FetchQuestionEvent()),
          color: AppTheme.secondary,
        ),
      ],
    );
  }
} 