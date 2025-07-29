import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/question_bloc.dart';
import '../bloc/question_event.dart';
import '../bloc/question_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        title: const Text(
          "🎯 Eu Duvido!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF16213E),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF16213E), Color(0xFF0F3460)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<QuestionBloc, QuestionState>(
            builder: (context, state) {
              if (state is QuestionInitial) {
                return _buildWelcomeScreen(context);
              } else if (state is QuestionLoading) {
                return _buildLoadingScreen();
              } else if (state is QuestionLoaded) {
                return _buildQuestionScreen(context, state);
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: const Icon(
              Icons.quiz,
              size: 80,
              color: Color(0xFFE94560),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Bem-vindo ao\nEu Duvido!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Desafie seus amigos com perguntas de quantidade!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 40),
          _buildAnimatedButton(
            context,
            "🎮 COMEÇAR JOGO",
            () => context.read<QuestionBloc>().add(FetchQuestionEvent()),
            const Color(0xFFE94560),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const CircularProgressIndicator(
              color: Color(0xFFE94560),
              strokeWidth: 3,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Carregando pergunta...",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionScreen(BuildContext context, QuestionLoaded state) {
    return Column(
      children: [
        // Question counter
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFE94560).withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE94560)),
          ),
          child: Text(
            "Pergunta #${state.questionCount}",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE94560),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.question_mark,
                  size: 50,
                  color: Color(0xFFE94560),
                ),
                const SizedBox(height: 20),
                                 Text(
                   state.question.question,
                   textAlign: TextAlign.center,
                   style: const TextStyle(
                     fontSize: 24,
                     fontWeight: FontWeight.w600,
                     color: Colors.white,
                     height: 1.4,
                   ),
                 ),
                const SizedBox(height: 30),
                if (!state.showAnswer) ...[
                  _buildAnimatedButton(
                    context,
                    "🤔 EU DUVIDO!",
                    () => context.read<QuestionBloc>().add(ShowAnswerEvent()),
                    const Color(0xFFE94560),
                  ),
                ] else ...[
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE94560).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xFFE94560)),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "🎯 RESPOSTA:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE94560),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state.question.answer,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildAnimatedButton(
          context,
          "🔄 NOVA PERGUNTA",
          () => context.read<QuestionBloc>().add(FetchQuestionEvent()),
          const Color(0xFF533483),
        ),
      ],
    );
  }

  Widget _buildAnimatedButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
    Color color,
  ) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.8)],
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(15),
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
