import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/get_random_question_usecase.dart';
import 'question_event.dart';
import 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final GetRandomQuestionUseCase useCase;
  int _questionCount = 0;

  QuestionBloc(this.useCase) : super(QuestionInitial()) {
    on<FetchQuestionEvent>((event, emit) async {
      emit(QuestionLoading());
      final question = await useCase();
      _questionCount++;
      emit(QuestionLoaded(question, questionCount: _questionCount));
    });

    on<ShowAnswerEvent>((event, emit) {
      if (state is QuestionLoaded) {
        final currentState = state as QuestionLoaded;
        emit(QuestionLoaded(
          currentState.question, 
          showAnswer: true,
          questionCount: currentState.questionCount,
        ));
      }
    });
  }
}
