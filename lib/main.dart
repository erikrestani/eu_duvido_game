import 'package:eu_duvido/features/game/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'features/game/data/question_repository_impl.dart';
import 'features/game/domain/question_repository.dart';
import 'features/game/application/get_random_question_usecase.dart';
import 'features/game/presentation/bloc/question_bloc.dart';

void main() {
  final QuestionRepository repo = QuestionRepositoryImpl();
  final useCase = GetRandomQuestionUseCase(repo);

  runApp(MyApp(useCase));
}

class MyApp extends StatelessWidget {
  final GetRandomQuestionUseCase useCase;

  const MyApp(this.useCase, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eu Duvido!',
      theme: ThemeData(
        scaffoldBackgroundColor: AppTheme.scaffoldBackgroundColor,
        appBarTheme: AppTheme.appBarTheme,
        iconTheme: AppTheme.iconTheme,
        primaryColor: AppTheme.primary,
        colorScheme: const ColorScheme.dark(
          primary: AppTheme.primary,
          secondary: AppTheme.secondary,
          surface: AppTheme.surface,
        ),
      ),
      home: BlocProvider(
        create: (_) => QuestionBloc(useCase),
        child: const HomePage(),
      ),
    );
  }
}
