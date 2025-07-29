import '../domain/question_repository.dart';
import '../domain/question_entity.dart';

class GetRandomQuestionUseCase {
  final QuestionRepository repository;

  GetRandomQuestionUseCase(this.repository);

  Future<QuestionEntity> call() {
    return repository.fetchRandomQuestion();
  }
}
