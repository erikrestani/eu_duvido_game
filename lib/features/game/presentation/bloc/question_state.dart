import '../../domain/question_entity.dart';

abstract class QuestionState {}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}

class QuestionLoaded extends QuestionState {
  final QuestionEntity question;
  final bool showAnswer;
  final int questionCount;

  QuestionLoaded(this.question, {this.showAnswer = false, this.questionCount = 1});
}
