import '../entities/vocabulary_word.dart';
import '../repositories/vocabulary_repository.dart';

class GetWordsUseCase {
  final VocabularyRepository repository;

  GetWordsUseCase(this.repository);

  Future<List<VocabularyWord>> call() async {
    return await repository.getWords();
  }
}
