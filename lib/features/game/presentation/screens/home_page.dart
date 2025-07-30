import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../bloc/question_bloc.dart';
import '../bloc/question_state.dart';
import 'welcome_screen.dart';
import 'loading_screen.dart';
import 'question_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🎯 Eu Duvido!"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingL),
          child: BlocBuilder<QuestionBloc, QuestionState>(
            builder: (context, state) {
              if (state is QuestionInitial) {
                return const WelcomeScreen();
              } else if (state is QuestionLoading) {
                return const LoadingScreen();
              } else if (state is QuestionLoaded) {
                return QuestionScreen(state: state);
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
