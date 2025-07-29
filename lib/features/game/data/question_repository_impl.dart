import 'package:eu_duvido/features/game/domain/question_entity.dart';
import 'package:eu_duvido/features/game/domain/question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final List<QuestionEntity> _questions = [
    QuestionEntity(
      question: 'Quantas pessoas existem no mundo atualmente?',
      answer: 'Aproximadamente 8 bilhões',
    ),
    QuestionEntity(
      question: 'Quantas pessoas têm cabelo colorido no mundo?',
      answer: 'Aproximadamente 1.2 bilhões',
    ),
    QuestionEntity(
      question: 'Quantas pessoas cabem no menor estádio do mundo?',
      answer: 'Apenas 30 pessoas',
    ),
    QuestionEntity(
      question: 'Quantos passos uma pessoa dá em média por dia?',
      answer: 'Entre 3.000 e 4.000 passos',
    ),
    QuestionEntity(
      question: 'Quantas vezes o coração bate por minuto?',
      answer: 'Entre 60 e 100 batimentos',
    ),
    QuestionEntity(
      question: 'Quantos litros de água uma pessoa bebe por dia?',
      answer: 'Entre 2 e 3 litros',
    ),
    QuestionEntity(
      question: 'Quantas horas uma pessoa dorme por noite?',
      answer: 'Entre 7 e 9 horas',
    ),
    QuestionEntity(
      question: 'Quantos dentes um adulto tem?',
      answer: '32 dentes',
    ),
    QuestionEntity(
      question: 'Quantas pessoas morrem por dia no mundo?',
      answer: 'Aproximadamente 150.000 pessoas',
    ),
    QuestionEntity(
      question: 'Quantas pessoas nascem por dia no mundo?',
      answer: 'Aproximadamente 385.000 pessoas',
    ),
    QuestionEntity(
      question: 'Quantos anos vive uma pessoa em média?',
      answer: '72.6 anos globalmente',
    ),
    QuestionEntity(
      question: 'Quantas pessoas usam internet no mundo?',
      answer: 'Aproximadamente 5.3 bilhões',
    ),
    QuestionEntity(
      question: 'Quantas pessoas têm celular no mundo?',
      answer: 'Aproximadamente 6.6 bilhões',
    ),
    QuestionEntity(
      question: 'Quantas pessoas vivem em favelas no mundo?',
      answer: 'Aproximadamente 1 bilhão',
    ),
    QuestionEntity(
      question: 'Quantas pessoas são vegetarianas no mundo?',
      answer: 'Aproximadamente 375 milhões',
    ),
  ];

  @override
  Future<QuestionEntity> fetchRandomQuestion() async {
    await Future.delayed(Duration(milliseconds: 500));
    _questions.shuffle();
    return _questions.first;
  }
}
