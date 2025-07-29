import 'question_entity.dart';

abstract class QuestionRepository {
  Future<QuestionEntity> fetchRandomQuestion();
}
